//
//  ContentView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

enum CellOption {
    case searchable
    case refreshable
    
    @ViewBuilder
    func getView() -> some View {
        switch self {
        case .searchable:
            SearchView()
        case .refreshable:
            RefreshView()
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .searchable:
            return "searchable"
        case .refreshable:
            return "refreshable"
        }
    }
}

struct ContentView: View {
    var options: [CellOption] = [
        .searchable,
        .refreshable
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(options, id: \.self) {
                    ContentCellView(option: $0)
                }
            }
            .navigationBarTitle("Home", displayMode: .automatic)
        }
    }
}

struct ContentCellView: View {
    var option: CellOption
    
    var body: some View {
        NavigationLink(option.getTitle(), destination: option.getView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
