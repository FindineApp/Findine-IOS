//
//  FilterView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI
import MapKit

struct FilterView: View {
    var body: some View {
        VStack {
            FilterTitleView()
            FilterTypeView()
            FilterDistanceView()
            Spacer()
        }
    }
}

struct FilterTitleView: View {
    var body: some View {
        HStack {
            
            Text("Filter")
                .bold()
                .font(.title2)
            
        }
    }
}

struct FilterTypeView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Dining Type")
                    .bold()
                    .font(.title3)
                    Spacer()
            }
            
            HStack {
                Button(action: {print("button pressed")}) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 20, height: 25, alignment: .center)
                            .padding(.trailing, 3)
                        
                        Text("Restaurant")
                            .bold()
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(lightGray)
                .cornerRadius(20)
                
                Button(action: {print("button pressed")}) {
                    HStack {
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 25, height: 20, alignment: .center)
                            .padding(.trailing, 3)
                        
                        Text("Cafe")
                            .bold()
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(lightGray)
                .cornerRadius(20)
            }
            
        }
        .padding(15)
    }
}

struct FilterDistanceView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Distance")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            
            Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true)
                .frame(maxWidth: .infinity, maxHeight: 240)
                .onAppear {viewModel.checkIfLocationServicesIsEnabled()}
            
        }
        .padding(15)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
