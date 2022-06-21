//
//  CoinInfoHeaderCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 20.06.2022.
//

import UIKit

class CoinInfoHeaderCell: UITableViewCell {

    @IBOutlet weak var assetLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var holdingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    private func setFonts() {
        assetLabel.font = .rounded(ofSize: 15, weight: .medium)
        priceLabel.font = .rounded(ofSize: 15, weight: .medium)
        holdingLabel.font = .rounded(ofSize: 15, weight: .medium)
    }
}
