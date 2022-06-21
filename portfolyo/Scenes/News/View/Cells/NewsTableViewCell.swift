//
//  NewsTableViewCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptonLabel: UILabel!
    @IBOutlet weak var newsPublishDateLabel: UILabel!
    
    var newsData: Article? {
        didSet {
            setCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setCell() {
        setComponents()
        setViews()
    }
    
    private func setViews() {
        newsImageView.layer.cornerRadius = 16
        newsImageView.clipsToBounds = true
    }
    
    private func setComponents() {
        newsTitleLabel.text = newsData?.title
        newsDescriptonLabel.text = newsData?.description
        newsPublishDateLabel.text = calculatePublishDate()
        
        let url: URL = URL(string: newsData?.urlToImage ?? "")!
        newsImageView.sd_setImage(with: url)
    }
    
    private func calculatePublishDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: newsData?.publishedAt ?? "")!
        return date.timeAgoDisplay()
    }
}
