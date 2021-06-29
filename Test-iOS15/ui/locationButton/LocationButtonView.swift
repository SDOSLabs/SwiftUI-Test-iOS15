//
//  LocationButtonView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 29/6/21.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct LocationButtonView: View {
    
    @ObservedObject var model = LocationButtonViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            Map(coordinateRegion: $model.region)
                .overlay(
                    Group {
                    if model.fetchingLocation {
                        ProgressView()
                            .tint(.black)
                    } else {
                        LocationButton(.currentLocation) {
                            model.requestLocation()
                        }
                        .overlay(
                            Circle()
                                .stroke(.gray, lineWidth: 1)
                        )
                    }
                }
                .frame(width: 44, height: 44)
                .cornerRadius(22)
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
                .tint(.white)
                .offset(x: proxy.size.width / 2 - 44, y: proxy.size.height / 2 - 64)
                .padding()
                )
        }
        .navigationBarTitle("locationButton", displayMode: .inline)
    }
}

struct LocationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LocationButtonView()
    }
}
