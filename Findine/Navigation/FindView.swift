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
    
    let themeColor = Color(red: 0.9647, green: 0.4235, blue: 0.2706)
    
    var body: some View {
            
        ZStack {
            Map(coordinateRegion: $mapRegion)
            Circle()
                .frame(width: 175, height: 175)
                .foregroundColor(themeColor)
                .shadow(radius: 15)
            Text("Find")
                .bold()
                .foregroundColor(Color.white)
                .font(.largeTitle)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {print("button pressed")}) {
                        Image(systemName: "slider.horizontal.3")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 34, height: 34, alignment: .center)
                    }
                    .padding(12)
                    .background(themeColor)
                    .foregroundColor(Color.white)
                    .shadow(radius: 10)
                    .cornerRadius(5)
                    .padding(15)
                    
                }
                Spacer()
            }
            
        }
    
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
