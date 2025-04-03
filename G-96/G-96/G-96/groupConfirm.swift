//
//  groupConfirm.swift
//  G-96
//
//  Created by Tech on 2025-03-06.
//

import UIKit

class groupConfirm: UIViewController {    
    @IBOutlet var groupNameTextField: UITextField!

    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        if let newGroupName = groupNameTextField.text, !newGroupName.isEmpty {
            DataManager.shared.groups.append(newGroupName)
            DataManager.shared.items[newGroupName] = [:] // empty item list for this group
        }

        navigationController?.popViewController(animated: true)
    }

    
}

