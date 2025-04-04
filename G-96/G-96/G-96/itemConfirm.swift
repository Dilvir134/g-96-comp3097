//
//  groupConfirm.swift
//  G-96
//
//  Created by Tech on 2025-03-06.
//

import UIKit
import CoreData

class itemConfirm: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var itemNameTextField: UITextField!
    @IBOutlet var itemPriceTextField: UITextField!
    
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var taxSwitch: UISwitch!

    
    var selectedGroup: ShoppingGroup?  // passed from itemViewController
    
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        guard let group = selectedGroup,
              let itemName = itemNameTextField.text, !itemName.isEmpty,
              let priceText = itemPriceTextField.text,
              let quantityText = quantityTextField.text,
              let quantity = Int16(quantityText), quantity > 0 else {
            print("Invalid input")
            return
        }

        let cleanPrice = priceText.replacingOccurrences(of: ",", with: ".")
        guard let price = Double(cleanPrice) else {
            print("Invalid price format")
            return
        }

        let taxApplicable = taxSwitch.isOn

        let newItem = ShoppingItem(context: context)
        newItem.id = UUID()
        newItem.name = itemName
        newItem.price = price
        newItem.quantity = quantity
        newItem.taxApplicable = taxApplicable
        newItem.group = group

        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("❌ Failed to save item: \(error)")
        }
    }


}

