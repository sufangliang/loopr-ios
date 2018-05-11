//
//  OrderBookTableViewCell.swift
//  loopr-ios
//
//  Created by xiaoruby on 5/10/18.
//  Copyright © 2018 Loopring. All rights reserved.
//

import UIKit

class OrderBookTableViewCell: UITableViewCell {

    var order: Order?

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var seperateLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // priceLabel.theme_textColor = GlobalPicker.textColor
        priceLabel.font = FontConfigManager.shared.getLabelFont()
        
        amountLabel.theme_textColor = GlobalPicker.textColor
        amountLabel.font = FontConfigManager.shared.getLabelFont()
        
        totalLabel.theme_textColor = GlobalPicker.textColor
        totalLabel.font = FontConfigManager.shared.getLabelFont()
        
        seperateLine.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update() {
        guard let order = order else {
            return
        }

        if order.originalOrder.side.lowercased() == "sell" {
            let price = order.originalOrder.amountBuy / order.originalOrder.amountSell
            priceLabel.text = String(format: "%.8f", price)
            amountLabel.text = String(format: "%.4f", order.originalOrder.amountSell)
            totalLabel.text = String(format: "%.4f", order.originalOrder.amountBuy)
            priceLabel.textColor = UIColor.init(rgba: "#F52929")
        } else if order.originalOrder.side.lowercased() == "buy" {
            let price = order.originalOrder.amountSell / order.originalOrder.amountBuy
            priceLabel.text = String(format: "%.8f", price)
            amountLabel.text = String(format: "%.4f", order.originalOrder.amountBuy)
            totalLabel.text = String(format: "%.4f", order.originalOrder.amountSell)
            priceLabel.textColor = UIColor.init(rgba: "#24DF93")
        }
    }
    
    class func getCellIdentifier() -> String {
        return "OrderBookTableViewCell"
    }
    
    class func getHeight() -> CGFloat {
        return 45
    }

}