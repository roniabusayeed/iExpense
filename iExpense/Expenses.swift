//
//  Expenses.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-24.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    var businessItems: [ExpenseItem] { items.filter { $0.type == "Business" } }
    var personalItems: [ExpenseItem] { items.filter { $0.type == "Personal" } }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
                items = decoded
                return
            }
        }
        
        items = []
    }
}
