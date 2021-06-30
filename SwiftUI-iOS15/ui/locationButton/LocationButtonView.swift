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
                        }
                    }
                    .foregroundColor(.white)
                    .cornerRadius(15)
//                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .tint(.blue)
                    .offset(y: proxy.size.height / 2 - 64)
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
