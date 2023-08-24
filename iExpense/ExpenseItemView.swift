//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Abu Sayeed Roni on 2023-08-24.
//

import SwiftUI

struct ExpenseItemView: View {
    let expenseItem: ExpenseItem
    
    var severity: some View {
        let color: Color
        if expenseItem.amount < 10 {
            color = .green
        } else if expenseItem.amount < 100 {
            color = .yellow
        } else {
            color = .red
        }
        
        return color
            .frame(width: 10, height: 10)
            .clipShape(Circle())
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(expenseItem.name)
                    .font(.headline)
                HStack(spacing: 5) {
                    severity
                    Text(expenseItem.type)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
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
