//
//  ForegroundStyleView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 29/6/21.
//

import SwiftUI

struct ForegroundStyleView: View {
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Image(systemName: "triangle.fill")
                Text("Hello, world!")
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 20)
            }
            .foregroundStyle(
                .linearGradient(
                    colors: [.yellow, .blue],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            HStack {
                Image(systemName: "triangle.fill")
                Text("Hello, world!")
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 20)
            }
            .foregroundStyle(Color.teal)
        }
        .navigationBarTitle("foregroundStyle", displayMode: .inline)
    }
}

struct ForegroundStyleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForegroundStyleView()
        }
    }
}
