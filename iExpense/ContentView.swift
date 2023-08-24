//
//  ContentView.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    func removeBusinessItems(at offsets: IndexSet) {
        let businessItems = expenses.businessItems
        for offset in offsets {
            let itemID = businessItems[offset].id
            expenses.items.removeAll(where: { item in
                item.id == itemID
            })
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        let personalItems = expenses.personalItems
        for offset in offsets {
            let itemID = personalItems[offset].id
            expenses.items.removeAll(where: { item in
                item.id == itemID
            })
        }
    }
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.businessItems) { item in
                        ExpenseItemView(expenseItem: item)
                    }
                    .onDelete(perform: removeBusinessItems)
                }
                
                Section {
                    ForEach(expenses.personalItems) { item in
                        ExpenseItemView(expenseItem: item)
                    }
                    .onDelete(perform: removePersonalItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
