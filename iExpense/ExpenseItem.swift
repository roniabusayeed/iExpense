//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-24.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    
    let name: String
    let type: String
    let amount: Double
}
