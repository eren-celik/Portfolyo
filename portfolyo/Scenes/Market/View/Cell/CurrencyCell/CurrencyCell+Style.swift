//
//  CurrencyCell+Style.swift
//  portfolyo
//
//  Created by Eren  Çelik on 17.06.2022.
//

import UIKit

extension CurrencyCell {
    
    func setStyle() {
        setShadow()
        setCornerRadius()
        setColor()
        setFonts()
    }
    
    private func setShadow() {
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }
    
    private func setCornerRadius() {
        containerView.layer.cornerRadius = 8
        
        currencyImage.clipsToBounds = true
        currencyImage.layer.cornerRadius = 20
    }
    
    private func setColor() {
        if (coinData?.priceChangePercentage24H ?? 0) > 0 {
            diffrenceLabel.textColor = .green
        }else {
            diffrenceLabel.textColor = .red
        }
        
    }
    
    private func setFonts() {
        nameLabel.font = .rounded(ofSize: 16, weight: .medium)
        priceLabel.font = .rounded(ofSize: 16, weight: .regular)
        diffrenceLabel.font = .rounded(ofSize: 10, weight: .semibold)
    }
}
