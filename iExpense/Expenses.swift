//
//  Expenses.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-24.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] = []
}
