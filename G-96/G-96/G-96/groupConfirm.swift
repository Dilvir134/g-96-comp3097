//
//  groupConfirm.swift
//  G-96
//
//  Created by Tech on 2025-03-06.
//
import UIKit
import CoreData

class groupConfirm: UIViewController {

    @IBOutlet var groupNameTextField: UITextField!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        guard let groupName = groupNameTextField.text, !groupName.isEmpty else {
            print("⚠️ Group name is empty.")
            return
        }

        // Create and configure new ShoppingGroup
        let newGroup = ShoppingGroup(context: context)
        newGroup.id = UUID()
        newGroup.name = groupName
        newGroup.icon = "default" // You can add icon selection later

        // Save to Core Data
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("❌ Failed to save group: \(error)")
        }
    }
}


