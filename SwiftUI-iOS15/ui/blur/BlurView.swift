//
//  BlurView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 28/6/21.
//

import SwiftUI

struct MaterialItem {
    let title: String
    let materialModifier: Material
}

struct BlurView: View {
    var items: [MaterialItem] = [
        MaterialItem(title: "ultraThickMaterial", materialModifier: .ultraThickMaterial),
        MaterialItem(title: "thickMaterial", materialModifier: .thickMaterial),
        MaterialItem(title: "regularMaterial", materialModifier: .regularMaterial),
        MaterialItem(title: "thinMaterial", materialModifier: .thinMaterial),
        MaterialItem(title: "ultraThinMaterial", materialModifier: .ultraThinMaterial),
    ]
    var body: some View {
        List {
            ForEach(items, id: \.title) {
                BlurCell(materialItem: $0)
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("blurView", displayMode: .inline)
    }
}

struct BlurCell: View {
    var materialItem: MaterialItem
    
    var body: some View {
        ZStack {
            Image("background_big_sur")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 80)
                    .clipped()
            
            Text("_\(materialItem.title)_")
                .padding(15)
                .background(materialItem.materialModifier)
                .clipShape(
                    Capsule()
                )
        }
        .listRowInsets(EdgeInsets())
        .padding(.vertical, 5)
        .listRowSeparator(.hidden)
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BlurView()
        }
    }
}
