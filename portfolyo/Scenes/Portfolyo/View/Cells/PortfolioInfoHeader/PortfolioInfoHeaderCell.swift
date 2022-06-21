//
//  PortfolioInfoHeaderCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

final class PortfolioInfoHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func setupCell(balance: String) {
        titleLabel.text = "Current Balance"
        balanceLabel.text = balance
    }
    
    func setStyle() {
        titleLabel.font = .rounded(ofSize: 17, weight: .medium)
        balanceLabel.font = .rounded(ofSize: 30, weight: .semibold)
    }
}
