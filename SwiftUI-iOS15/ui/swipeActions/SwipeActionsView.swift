//
//  SwipeActionsView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 24/6/21.
//

import SwiftUI

struct SwipeActionsView: View {
    @ObservedObject var model = SwipeActionsViewModel()
    
    var body: some View {
        VStack {
            if model.items.count > 0 {
                List {
                    ForEach(model.items, id: \.self) {
                        SwipeActionCell(text: $0)
                    }
                }
            } else {
                Text("No results")
            }
        }
        .navigationBarTitle("swipeActions", displayMode: .inline)
        .task {
            await model.loadData()
        }
    }
}

struct SwipeActionCell: View {
    var text: String
    
    var body: some View {
        Text(text)
            .swipeActions {
                Button {
                    print("Action Favorite")
                } label: {
                    Label("Favorite", systemImage: "star.fill")
                }
                .tint(Color.yellow)

                Button(role: .destructive) {
                    print("Action Delete")
                } label: {
                    Label("Delete", systemImage: "trash.fill")
                }
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button {
                    print("Action Archive")
                } label: {
                    Label("Archive", systemImage: "folder.fill")
                }
                .tint(Color.blue)
            }
    }
}

struct SwipeActionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SwipeActionsView()
        }
    }
}
