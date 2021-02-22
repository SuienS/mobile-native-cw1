//
//  HistoryViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class HistoryViewController: UIViewController {

    // Outlet for the TableView
    @IBOutlet weak var tableViewHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        UnitAppUtils.syncHistoryData()

        tableViewHistory.delegate = self
        tableViewHistory.dataSource = self
        self.tableViewHistory.rowHeight = 65.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Synchronizing Data
        UnitAppUtils.syncHistoryData()
        
        // Refreshing the UI reloading the data
        tableViewHistory.reloadData()

    }


}


// Exntension presetning modally for Single History Entry view
extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewHistory.deselectRow(at: indexPath, animated: true)
        
        let singleHistoryView = HistorySingleViewController(historyEntry: UnitAppUtils.historyEntries[indexPath.row].historyEntry)
        
        // Presenting the Dynamically created view modally
        present(UINavigationController(rootViewController: singleHistoryView), animated: true)
        
    }
    
}

// Populating the TableView
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UnitAppUtils.historyEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellHistory = tableViewHistory.dequeueReusableCell(withIdentifier: "cellHistory", for: indexPath)
        
        cellHistory.textLabel?.text = UnitAppUtils.historyEntries[indexPath.row].historyEntry
        
        return cellHistory
    }
    
}

