//
//  AsyncImageView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 25/6/21.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://sdos.es/sites/default/files/Blog/SwiftUI/Image/star_wars.jpg")) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                Color.gray
                ProgressView()
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .clipped()
        .navigationBarTitle("asyncImageView", displayMode: .inline)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AsyncImageView()
        }
    }
}
