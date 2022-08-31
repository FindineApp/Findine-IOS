//
//  FindView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI
import MapKit

struct FindView: View {
    // Save the state of the map
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion)
            FindButtonView()
                .frame(width: 175, height: 175, alignment: .center)
                .cornerRadius(90)
                .shadow(radius: 15)
            FilterButtonView()
        }
        
    }
}

struct FindButtonView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: PlaceDetailsView(), label: {
                ZStack {
                    Circle()
                        .frame(width: 175, height: 175)
                        .foregroundColor(themeColor)
                        .shadow(radius: 15)
                    Text("Find")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                }
                .navigationBarHidden(true)
            })
        }
    }
}

struct FilterButtonView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {print("button pressed")}) {
                    Image(systemName: "slider.horizontal.3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                }
                .padding(11)
                .background(themeColor)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding(15)
                .shadow(radius: 10)
                
            }
            Spacer()
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
