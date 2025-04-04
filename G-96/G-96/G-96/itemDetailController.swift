//
//  itemDetailController.swift
//  G-96
//
//  Created by Tech on 2025-03-06.
//

import UIKit

class itemDetailController: UIViewController {
    
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    @IBOutlet var itemTotalLabel: UILabel!
    
    var itemDetails : ShoppingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = itemDetails {
            let price = item.price
            let name = item.name ?? "Unnamed"
            let total = price + (price * 0.13)

            itemNameLabel.text = name
            itemPriceLabel.text = String(format: "Price: $%.2f", price)
            itemTotalLabel.text = String(format: "Total: $%.2f", total)
        }
    }

    
}
