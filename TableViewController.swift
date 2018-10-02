import UIKit
// TableViewController.swift is run by the UITableViewContoller on main.storyboard
class TableViewController: UITableViewController {
    // lets "cell" be reused
    let reuseIdentifier = "cell"
    // this tells how many rows to have +1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // this tells how many rows to have +1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            else { fatalError("Failed cell guarantee") }
        
        cell.textLabel?.text = Model.shared.items[indexPath.row].title
        
        return cell
    }
    
    let addSegueIdentifier = "add"
    let modifySegueIdentifier = "modify"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController
            else { fatalError("Segue destination failed") }
        
        guard let identifier = segue.identifier
            else { fatalError("No segue identifier provided") }
        
        switch identifier {
        case addSegueIdentifier:
            detailViewController.indexPath = nil
            
        case modifySegueIdentifier:
            guard let indexPath = tableView.indexPathForSelectedRow
                else { fatalError("Unable to retrieve selected index path") }
            detailViewController.indexPath = indexPath
            
        default:
            fatalError("Unknown segue identifier: \(identifier)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

