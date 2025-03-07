import UIKit

class itemViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet var itemListTableView: UITableView!
    @IBOutlet var confirmItemButton: UIButton!
    
    @IBAction func didTapButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    var selectedItem = "Food"
    
    var itemData = ["Food": ["Pizza": 15.0, "Biryani": 25.0],
                    "Medicine": ["asdf": 10.0],
                    "Streaming Services": ["Netflix": 100.0],
                    "Cleaning Items": ["Lysol": 120.0]]
    
    var list: [String : Double]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        list = itemData[selectedItem]
        itemLabel.text = "\(selectedItem) List"
    }
}

extension itemViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let destinationVC = segue.destination as? itemDetailController,
           let indexPath = sender as? IndexPath {
            if let list = list {
                    let itemNames = Array(list.keys)
                    let itemName = itemNames[indexPath.row]
                    let price = list[itemName] ?? 0

                    destinationVC.itemDetails = [itemName: price]
                }
        }
    }
}

extension itemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        if let list = list {
                let itemNames = Array(list.keys)
                let itemName = itemNames[indexPath.row]
                let price = list[itemName] ?? 0

                cell.textLabel?.text = "\(itemName) - $\(price)"
            }
            
            return cell
    }
}
