//
//  ViewController.swift
//  G-96
//
//  Created by Tech on 2025-03-05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var groupListTableView: UITableView!
    
//    @IBOutlet var confirmGroupButton: UIButton!
//
//    @IBAction func didTapConfirmButton(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
//    }
//
    
    let groupData = ["Food", "Medicine", "Streaming Services", "Cleaning Items"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        groupListTableView.delegate = self
        groupListTableView.dataSource = self
        
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
            destinationVC.selectedItem = groupData[indexPath.row]
        }
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        cell.textLabel?.text = groupData[indexPath.row]
        return cell
    }
}





