//
//  DataManager.swift
//  G-96
//
//  Created by Akorede Osunkoya on 2025-04-03.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private init() {}  // Singleton

    var groups: [String] = ["Food", "Medicine", "Streaming Services", "Cleaning Items"]

    var items: [String: [String: Double]] = [
        "Food": ["Pizza": 15.0, "Biryani": 25.0],
        "Medicine": ["Paracetamol": 10.0],
        "Streaming Services": ["Netflix": 100.0],
        "Cleaning Items": ["Lysol": 120.0]
    ]
}
