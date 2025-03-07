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
    
    var itemDetails : [String: Double]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemDetails = itemDetails, let (itemName, price) = itemDetails.first {
            let total = price + (price * 0.13)
            itemNameLabel.text = "\(itemName)"
            itemPriceLabel.text = "Price: $\(price)"
            itemTotalLabel.text = "Total: $\(total)"
        }
    }
    
}
