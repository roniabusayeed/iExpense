//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-24.
//

import SwiftUI

struct ExpenseItemView: View {
    let expenseItem: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expenseItem.name)
                    .font(.headline)
                Text(expenseItem.type)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(expenseItem.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.headline)
        }
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(expenseItem: .init(name: "Groceries", type: "Personal", amount: 120))
    }
}
