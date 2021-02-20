//
//  HistoryEntry.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-20.
//

import Foundation

class HistoryEntry: Codable {
    
    var historyEntry: String = ""
    
    init(historyString h_str: String ) {
        self.historyEntry = h_str
    }
    
}
