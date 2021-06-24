//
//  RefreshViewModel.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class RefreshViewModel: ObservableObject {
    @Published var items: [String] = [String]()
    
    init() { }
    
    func loadData() async {
        for i in 0..<100 {
            items.append("Index \(i)")
        }
        items = items.shuffled()
    }
    
}
