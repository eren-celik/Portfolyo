//
//  CurrencyCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 17.06.2022.
//

import UIKit
import SDWebImage

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var diffrenceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currencyImage: UIImageView!
    
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
        currencyImage.image = nil
    }
    
    func setCoinData() {
        nameLabel.text = coinData?.name ?? ""
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let number = NSNumber(value: coinData?.currentPrice ?? 0)
        let formattedValue = formatter.string(from: number)!
        priceLabel.text = formattedValue
        
        diffrenceLabel.text = String(format: "%.2f", coinData?.priceChangePercentage24H ?? "")
        guard let imageURL = URL(string: coinData?.image ?? "") else { return }
        currencyImage.sd_setImage(with: imageURL)
    }
    
    func setCurrencyData(name: String, value: Double) {
        nameLabel.text = name
        priceLabel.text = getSymbol(forCurrencyCode: name) + " " + String(format: "%.2f", value)
        diffrenceLabel.text = ""
        
        let code = name.lowercased()
        guard let imageURL = URL(string: "https://raw.githubusercontent.com/transferwise/currency-flags/master/src/flags/\(code).png") else { return }
        currencyImage.sd_setImage(with: imageURL)
    }
    
    private func getSymbol(forCurrencyCode code: String) -> String {
       let locale = NSLocale(localeIdentifier: code)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code) ?? ""
    }
    
    private func setPopularCurrencyImage() {
        
    }
}
