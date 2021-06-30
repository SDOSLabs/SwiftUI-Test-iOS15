//
//  PrivacySensitiveView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

struct PrivacySensitiveView: View {
    @ObservedObject var model = PrivacySensitiveViewModel()
    
    var body: some View {
        VStack {
            if model.items.count > 0 {
                List {
                    ForEach(model.items, id: \.self) {
                        PrivacySensitiveCell(text: $0)
                    }
                }
            } else {
                Text("No results")
            }
        }
        .navigationBarTitle("privacySensitive", displayMode: .inline)
        .task {
            await model.loadData()
        }
    }
}

struct PrivacySensitiveCell: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Privacy Sensitive text: \(text)")
                .privacySensitive()
            Text("Normal text: \(text)")
        }
        .padding(.vertical, 5)
    }
}

struct PrivacySensitiveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PrivacySensitiveView()
        }
    }
}
