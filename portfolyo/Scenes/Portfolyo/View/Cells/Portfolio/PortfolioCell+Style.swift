//
//  PortfolioCell+Style.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit
import SDWebImage

extension PortfolioCell {
    
    func setStyle() {
        setShadow()
        setCornerRadius()
        setColor()
        setFonts()
        setAligment()
    }
    
    func formatPrice() {
        priceLabel.text = coinData?.currentPrice?.convertPrice()
        totalPriceLabel.text = coinData?.currentHoldingsValue.convertPrice()
    }
    
    private func setShadow() {
        containerView.layer.shadowColor = UIColor(red: 0,
                                                  green: 0,
                                                  blue: 0,
                                                  alpha: 0.08).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }
    
    private func setCornerRadius() {
        containerView.layer.cornerRadius = 8
        
        itemImageView.clipsToBounds = true
        itemImageView.layer.cornerRadius = 20
    }
    
    private func setColor() {
        if (coinData?.priceChangePercentage24H ?? 0) > 0 {
            priceChangeLabel.textColor = .green
        }else {
            priceChangeLabel.textColor = .red
        }
        
    }
    
    private func setFonts() {
        nameLabel.font = .rounded(ofSize: 16, weight: .medium)
        itemCodeLabel.font = .rounded(ofSize: 10, weight: .regular)
        priceLabel.font = .rounded(ofSize: 16, weight: .regular)
        priceChangeLabel.font = .rounded(ofSize: 10, weight: .semibold)
        totalPriceLabel.font = .rounded(ofSize: 16, weight: .medium)
        totalAmountLabel.font = .rounded(ofSize: 10, weight: .regular)
    }
    
    private func setAligment() {
        priceLabel.textAlignment = .right
        totalPriceLabel.textAlignment = .right
        totalAmountLabel.textAlignment = .right
        priceChangeLabel.textAlignment = .right
    }
}
