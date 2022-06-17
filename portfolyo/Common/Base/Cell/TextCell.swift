//
//  TextCell.swift
//  portfolyo
//
//  Created by Eren  Çelik on 17.06.2022.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureLabel(text: String, size: CGFloat = 15, weight: UIFont.Weight = .medium) {
        cellTextLabel.text = text
        cellTextLabel.font = .rounded(ofSize: size, weight: weight)
    }
}
