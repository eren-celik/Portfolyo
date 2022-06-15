//
//  WalletViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit
import Charts

class WalletViewController: UIViewController {
    
    @IBOutlet weak var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.visibleViewController?.title = "Wallet"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupChartView()
    }
    
}
extension WalletViewController: ChartViewDelegate {
    
    func setupChartView() {
        chartView.delegate = self
        
        chartView.chartDescription.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        
        chartView.legend.form = .line
        
        
        chartView.animate(xAxisDuration: 2.5)
        
        let values = (0 ..< 12).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(23) + 4)
            return ChartDataEntry(x: Double(i), y: val, icon: UIImage(systemName: "app"))
        }
        
        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
        set1.drawIconsEnabled = false
        
        let value = ChartDataEntry(x: Double(3), y: 3)
        set1.addEntryOrdered(value)
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = LinearGradientFill(gradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
    }
}
