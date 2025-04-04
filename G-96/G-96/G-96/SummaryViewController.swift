//
//  SummaryViewController.swift
//  G-96
//
//  Created by Akorede Osunkoya on 2025-04-03.
//

import Foundation
import UIKit
import CoreData
//import DGCharts

class SummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var summaryTableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    
    //@IBOutlet var pieChartView: PieChartView!


    var groups: [ShoppingGroup] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        fetchGroups()
        calculateAndShowTotal()
        //loadPieChartData()
    }

    func fetchGroups() {
        let request: NSFetchRequest<ShoppingGroup> = ShoppingGroup.fetchRequest()
        do {
            groups = try context.fetch(request)
        } catch {
            print("Error fetching groups: \(error)")
        }
    }

    func calculateAndShowTotal() {
        var grandTotal: Double = 0
        for group in groups {
            if let items = group.items as? Set<ShoppingItem> {
                for item in items {
                    let base = item.price * Double(item.quantity)
                    let itemTotal = item.taxApplicable ? base * 1.13 : base
                    grandTotal += itemTotal
                }
            }
        }
        totalLabel.text = String(format: "Total: $%.2f", grandTotal)
    }
    
//    func loadPieChartData() {
//        var entries: [PieChartDataEntry] = []
//
//        for group in groups {
//            var groupTotal: Double = 0
//            if let items = group.items as? Set<ShoppingItem> {
//                for item in items {
//                    let base = item.price * Double(item.quantity)
//                    let itemTotal = item.taxApplicable ? base * 1.13 : base
//                    groupTotal += itemTotal
//                }
//            }
//
//            let name = group.name ?? "Unnamed"
//            if groupTotal > 0 {
//                entries.append(PieChartDataEntry(value: groupTotal, label: name))
//            }
//        }
//
//        let dataSet = PieChartDataSet(entries: entries, label: "Group Spend")
//        dataSet.sliceSpace = 2
//        dataSet.valueTextColor = .white
//
//        let data = PieChartData(dataSet: dataSet)
//        pieChartView.data = data
//        pieChartView.centerText = "Spending"
//    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath)
        let group = groups[indexPath.row]

        var groupTotal: Double = 0
        if let items = group.items as? Set<ShoppingItem> {
            for item in items {
                let base = item.price * Double(item.quantity)
                let itemTotal = item.taxApplicable ? base * 1.13 : base
                groupTotal += itemTotal
            }
        }

        let groupName = group.name ?? "Unnamed"
        cell.textLabel?.text = "\(groupName) - $\(String(format: "%.2f", groupTotal))"
        return cell
    }
}

