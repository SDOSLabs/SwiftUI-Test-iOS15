//
//  RowsSeparatorView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

struct RowsSeparatorView: View {
    @ObservedObject var model = RowsSeparatorViewModel()
    
    var body: some View {
        VStack {
            if model.items.count > 0 {
                List {
                    ForEach(model.items, id: \.self) {
                        SeparatorCell(text: $0)
                    }
                }
            } else {
                Text("Sin resultados")
            }
        }
        .navigationBarTitle("rowsSeparator", displayMode: .inline)
        .task {
            await model.loadData()
        }
    }
}

struct SeparatorCell: View {
    var text: String
    
    var body: some View {
        Text(text)
            .listRowSeparatorTint(Bool.random() ? .green : .blue)
            .listRowSeparator(Bool.random() ? .hidden : .visible)
    }
}

struct RowsSeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RowsSeparatorView()
        }
    }
}
