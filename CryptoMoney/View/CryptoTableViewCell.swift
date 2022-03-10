//
//  CryptoTableViewCell.swift
//  CryptoMoney
//
//  Created by Furkan Ayşavkı on 10.03.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
