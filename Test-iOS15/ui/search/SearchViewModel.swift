//
//  SearchViewModel.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    private var localItems: [String] = [String]()
    private var cancellable = Set<AnyCancellable>()
    
    @Published var searchText: String = ""
    @Published var items: [String] = [String]()
    
    init() {
        $searchText
            .receive(on: RunLoop.main)
            .sink { _ in
                async {
                    await self.filterResults()
                }
            }
            .store(in: &cancellable)
    }
    
    func loadData() async {
        for i in 0..<100 {
            localItems.append("Index \(i)")
        }
        localItems = localItems.shuffled()
        searchText = ""
        await filterResults()
    }
    
    func filterResults() async {
        if searchText.isEmpty {
            items = localItems
        } else {
            items = localItems.filter {
                $0.contains(searchText)
            }
        }
    }
    
}
