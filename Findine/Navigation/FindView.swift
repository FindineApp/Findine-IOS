//
//  FindView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import Foundation
import SwiftUI
import MapKit

struct FindView: View {
    // Save the state of the map
    @StateObject private var viewModel = FindViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true)
                    .onAppear {viewModel.checkIfLocationServicesIsEnabled()}
                NavigationLink(destination: PlaceDetailsView(), label: { FindButtonView()})
                NavigationLink(destination: PlaceDetailsView(), label: { FilterButtonView()})
            }
            .navigationBarHidden(true)
            .task {
                //let url = URL(string: )
                //let (data, _) = try await
            }
        }
        
    }
}

struct FindButtonView: View {
    var body: some View {
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

final class FindViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied this app location permission. please go to settings and change it")
        case .authorizedAlways, .authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }
    
    // automatically called when creating a new CLLocationManager object
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
