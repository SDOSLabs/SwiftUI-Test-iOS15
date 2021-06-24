//
//  ContentView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

enum CellOption {
    case search
    
    func getView() -> some View {
        switch self {
        case .search:
            return SearchView()
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .search:
            return "Search"
        }
    }
}

struct ContentView: View {
    var options: [CellOption] = [
        .search
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(options, id: \.self) {
                    ContentCellView(option: $0)
                }
            }
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
