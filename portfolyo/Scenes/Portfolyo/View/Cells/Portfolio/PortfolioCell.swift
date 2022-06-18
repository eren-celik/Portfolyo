//
//  PortfolioCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

class PortfolioCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemCodeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var coinData: CoinListElement? {
        didSet {
            setCoinData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
    }
    
    func setCoinData() {
        formatPrice()
        
        let itemCode = coinData?.symbol?.uppercased() ?? "n/a"
        nameLabel.text = coinData?.name ?? ""
        itemCodeLabel.text = itemCode
        totalAmountLabel.text = "\(Int(coinData?.currentHoldings ?? 0)) \(itemCode)"
        
        priceChangeLabel.text = String(format: "%.2f", coinData?.priceChangePercentage24H ?? "")
        guard let imageURL = URL(string: coinData?.image ?? "") else { return }
        itemImageView.sd_setImage(with: imageURL)
    }
    

}
