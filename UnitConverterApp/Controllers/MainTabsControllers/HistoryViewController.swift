//
//  HistoryViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableViewHistory: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        UnitAppUtils.syncHistoryData()

        tableViewHistory.delegate = self
        tableViewHistory.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UnitAppUtils.syncHistoryData()
        
        tableViewHistory.reloadData()

    }


}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewHistory.deselectRow(at: indexPath, animated: true)
        
        let singleHistoryView = HistorySingleViewController(historyEntry: UnitAppUtils.historyEntries[indexPath.row].historyEntry)
        present(UINavigationController(rootViewController: singleHistoryView), animated: true)
        
    }
    
}

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

