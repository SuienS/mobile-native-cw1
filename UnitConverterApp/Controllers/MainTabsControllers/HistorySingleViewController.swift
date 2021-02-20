//
//  HistorySingleViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-20.
//

import UIKit

class HistorySingleViewController: UIViewController {

    private let historyEntry: String
    private let historyType: String
    private let historyData: [Substring.SubSequence]

    init(historyEntry h_entry: String) {
        self.historyEntry = h_entry
        self.historyType = String(h_entry.split(separator: ":")[0])
        self.historyData = h_entry.split(separator: ":")[1].split(separator: "|")
        super.init(nibName:nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = historyType
        addHistoryLabels()

        // Do any additional setup after loading the view.
    }
    
    func addHistoryLabels() {
        var labelHistoryEntry: [UILabel] = []
        var yPosView = 90

        var lblsEq: [UILabel] = []
        
        for i in 0..<historyData.count {
            labelHistoryEntry.append(UILabel(frame: view.bounds))
            view.addSubview(labelHistoryEntry[i])
            labelHistoryEntry[i].textAlignment = .center
            labelHistoryEntry[i].numberOfLines = -1
            labelHistoryEntry[i].text = String(historyData[i])
            labelHistoryEntry[i].font = UIFont.boldSystemFont(ofSize: 22.0)
            labelHistoryEntry[i].frame = CGRect( x: 0, y:yPosView, width:Int(self.view.bounds.width), height: 80)
            yPosView += 40
            
            lblsEq.append(UILabel(frame: view.bounds))
            lblsEq[i].textAlignment = .center
            lblsEq[i].numberOfLines = -1
            lblsEq[i].text = "="
            lblsEq[i].font = UIFont.boldSystemFont(ofSize: 22.0)
            lblsEq[i].frame = CGRect( x: 0, y:yPosView, width:Int(self.view.bounds.width), height: 80)
            view.addSubview(lblsEq[i])

            yPosView += 40
        }
        lblsEq[lblsEq.count-1].isHidden = true
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
