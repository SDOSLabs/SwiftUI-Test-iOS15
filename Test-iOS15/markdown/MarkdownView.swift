//
//  MarkdownView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 29/6/21.
//

import SwiftUI

struct MarkdownView: View {
    var body: some View {
        VStack {
            Text("This is a **bold text**")
            Text("This is a *italic text* and this is other _italic way_")
            Text("This is a **bold and _italic_ text**")
            Text("This is a ~~strikethrough text~~")
            Text("This is a `monospaced text`")
            Text("This is a [Link](https://www.sdos.es/blog)")
        }
        .navigationBarTitle("markdown", displayMode: .inline)
    }
}

struct MarkdownView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MarkdownView()
        }
    }
}
