//
//  SearchView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var model = SearchViewModel()
    
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
        .searchable(text: $model.searchText)
        .navigationBarTitle("searchable", displayMode: .inline)
        .task {
            await model.loadData()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}
