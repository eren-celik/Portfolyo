//
//  GraphCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit
import Charts

class GraphCell: UITableViewCell {
    
    @IBOutlet weak var chartView: LineChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureChartView()
    }
    
    func configureChart(_ data: [Double]) {
        let values = setChartValues(data)
        let chart = LineChartDataSet(entries: values)
        setupChartStyle(chart)
        
        let data = LineChartData(dataSet: chart)
        chartView.data = data
    }
    
    private func setChartValues(_ data: [Double]) -> [ChartDataEntry] {
        let min = data.min() ?? 0
        let max = data.max() ?? 0
        let screen = UIScreen.main.bounds
        let yAxis = min - max
        
        return data.enumerated().map { (index, value) -> ChartDataEntry in
            let x = screen.width / CGFloat(data.count) * CGFloat(index + 1)
            let y = (1 - CGFloat((data[index] - min) / yAxis)) * screen.height
            return ChartDataEntry(x: x, y: y)
        }
    }
    
    private func configureChartView() {
        chartView.delegate = self
        chartView.chartDescription.enabled = false
        chartView.dragEnabled = false
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        setBallonMarker()
    }
    
    private func setBallonMarker() {
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
    }
    
    
    
    private func setupChartStyle(_ dataSet: LineChartDataSet) {
        dataSet.lineDashLengths = nil
        dataSet.highlightLineDashLengths = nil
        dataSet.setColors(.black, .red, .white)
        dataSet.setCircleColor(.black)
        dataSet.gradientPositions = [0, 40, 100]
        dataSet.lineWidth = 1
        dataSet.circleRadius = 3
        dataSet.drawCircleHoleEnabled = false
        dataSet.valueFont = .systemFont(ofSize: 9)
        dataSet.formLineDashLengths = nil
        dataSet.formLineWidth = 1
        dataSet.formSize = 15
        
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        dataSet.fillAlpha = 1
        dataSet.fill = LinearGradientFill(gradient: gradient, angle: 90)
        dataSet.drawFilledEnabled = true
    }
}

extension GraphCell: ChartViewDelegate {}
