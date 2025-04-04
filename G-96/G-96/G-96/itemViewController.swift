import UIKit

class itemViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet var itemListTableView: UITableView!
    @IBOutlet var confirmItemButton: UIButton!
    @IBOutlet var groupTotalLabel: UILabel!
    
    @IBAction func didTapButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    var selectedGroup: ShoppingGroup?

    

    
    
    
    var items: [ShoppingItem] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        guard let group = selectedGroup else { return }
        
        if let groupItems = group.items as? Set<ShoppingItem> {
            items = Array(groupItems).sorted(by: { $0.name ?? "" < $1.name ?? "" })
            itemLabel.text = "\(selectedGroup?.name ?? "Unnamed Group") List"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchItems()
        itemListTableView.reloadData()
        calculateTotal()
    }
    
    func fetchItems() {
        guard let group = selectedGroup else { return }
        
        if let groupItems = group.items as? Set<ShoppingItem> {
            items = Array(groupItems).sorted(by: { $0.name ?? "" < $1.name ?? "" })
        }
    }
    
    func calculateTotal() {
        var subtotal: Double = 0

        for item in items {
            let itemTotal = item.price * Double(item.quantity)
            subtotal += item.taxApplicable ? itemTotal * 1.13 : itemTotal
        }

        groupTotalLabel.text = String(format: "Total: $%.2f", subtotal)
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

            let item = items[indexPath.row]
            destinationVC.itemDetails = item

        } else if segue.identifier == "addItem",
                  let destinationVC = segue.destination as? itemConfirm {
            destinationVC.selectedGroup = selectedGroup
        }
    }



}

extension itemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)

        let item = items[indexPath.row]
        let name = item.name ?? "Unnamed"
        let price = item.price
        let quantity = item.quantity
        let total = price * Double(quantity)

        cell.textLabel?.text = "\(name) • Qty: \(quantity) • $\(String(format: "%.2f", total))"
        return cell
    }

}
