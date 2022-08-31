//
//  PlaceDetailsView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI
import MapKit

struct PlaceDetailsView: View {
    
    var body: some View {
        VStack {
            DetailsView()
            LocationView()
            ReviewsView()
            Spacer()
        }
    }
}

struct DetailsView: View {
    var body: some View {
        ImageSliderView()
            .frame(maxWidth: .infinity, maxHeight: 210)
        TitleView()
        HoursView()
        RateView()
        MoreView()
        MenuView()
        PhoneView()
    }
}

struct LocationView: View {
    var body: some View {
        AddressView()
        MapView()
        DirectionView()
    }
}

struct ImageSliderView: View {
    private let images = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        /*
        TabView {
            ForEach(images, id: \.self) {
                item in
                Image(item)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(PageTabViewStyle())
         */
        AsyncImage(url: URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/16/a5/b9/e9/photo1jpg.jpg")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        .ignoresSafeArea(edges: .all)
        
    }
     
}

struct TitleView: View {
    var body: some View {
        HStack {
            Text("HaiDiLao Richmond")
                .bold()
                .font(.title2)
                .padding(.horizontal, 15)
            Spacer()
        }
    }
}

struct HoursView: View {
    var body: some View {
        HStack {
            Text("Open Now")
                .bold()
                .font(.body)
                .foregroundColor(themeColor)
                .padding(.leading, 15)
            Text("Closes at 11:00 PM")
                .foregroundColor(Color.gray)
                .font(.body)
            Spacer()
        }
    }
}

struct RateView: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color.gray)
                .padding(.leading, 15)
            Text("4.7")
                .foregroundColor(Color.gray)
            Text("672 Reviews")
                .foregroundColor(Color.gray)
            Spacer()
        }
    }
}

struct MoreView: View {
    var body: some View {
        HStack {
            Text("$$$")
                .padding(.leading, 15)
            Text("Chinese")
            Spacer()
            
        }
        .foregroundColor(Color.gray)
        .padding(.bottom, 5)
    }
}

struct MenuView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Menu")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 15)
                Spacer()
            }
            HStack {
                Text("Menu: https://haidilao.com")
                    .padding(.leading, 15)
                    .foregroundColor(Color.gray)
                Spacer()
            }
        }
    }
}

struct PhoneView: View {
    var body: some View {
        HStack {
            Text("Reserve now:")
                .padding(.leading, 15)
            Text("604 368 3113")
            Spacer()
        }
        .foregroundColor(Color.gray)
        .padding(.bottom, 5)
    }
}

struct AddressView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Location")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            HStack {
                Text("5890 No.3 Rd Room 200, Richmond, BC V6X 3P6")
                    .font(.subheadline)
                Spacer()
            }
        }
        .padding(.horizontal, 15)
    }
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $mapRegion)
            .frame(height: 200)
    }
}

struct DirectionView: View {
    var body: some View {
        Button("Get Directions", action: {
            print("directions")
        })
        .padding(11)
        .frame(maxWidth: .infinity)
        .background(themeColor)
        .foregroundColor(Color.white)
        .cornerRadius(5)
        .padding(.horizontal, 15)
        .shadow(radius: 5)
    }
}

struct ReviewsView: View {
    var body: some View {
        HStack {
            Text("Reviews")
                .bold()
                .padding(.leading, 15)
                .font(.title3)
            Spacer()
        }
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView()
    }
}
