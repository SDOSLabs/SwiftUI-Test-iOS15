//
//  RefreshView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

struct RefreshView: View {
    @ObservedObject var model = RefreshViewModel()
    
    var body: some View {
        VStack {
            if model.items.count > 0 {
                List {
                    ForEach(model.items, id: \.self) {
                        Text("\($0) ")
                    }
                }
            } else {
                Text("Sin resultados")
            }
        }
        .navigationBarTitle("refreshable", displayMode: .inline)
        .refreshable {
            await model.loadData()
        }
        .task {
            await model.loadData()
        }
    }
}

struct RefreshView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RefreshView()
        }
    }
}
