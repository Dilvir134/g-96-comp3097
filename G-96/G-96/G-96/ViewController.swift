//
//  ViewController.swift
//  G-96
//
//  Created by Tech on 2025-03-05.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var groupListTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
//    @IBOutlet var confirmGroupButton: UIButton!
//
//    @IBAction func didTapConfirmButton(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
//    }
//
    
    var groups : [ShoppingGroup] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        groupListTableView.delegate = self
        groupListTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchGroups()
        groupListTableView.reloadData()
    }
    
    func fetchGroups() {
        let request: NSFetchRequest<ShoppingGroup> = ShoppingGroup.fetchRequest()
        
        do {
            groups = try context.fetch(request)
        } catch {
            print("❌ Failed to fetch groups: \(error)")
        }
    }




}



extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "groupSegue", sender: indexPath)
                
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "groupSegue",
           let destinationVC = segue.destination as? itemViewController,
           let indexPath = sender as? IndexPath {
            destinationVC.selectedGroup = groups[indexPath.row]
        }
        
        if segue.identifier == "showSummary" {
                // Nothing needed for now, no data is being passed
            }
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        let group = groups[indexPath.row]
        cell.textLabel?.text = group.name ?? "Unnamed Group"
        return cell
    }

}





