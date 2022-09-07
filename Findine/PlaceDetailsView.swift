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
        ScrollView(.vertical) {
            VStack {
                ImageSliderView()
                    .frame(maxWidth: .infinity, maxHeight: 280, alignment: .center)
                    .padding(.bottom, 10)
                TitleView()
                    .padding(.bottom, 15)
                DetailsView()
                    .padding(.bottom, 15)
                GetReadyView()
                    .padding(.bottom, 15)
                LocationView()
                ReviewsTitleView()
                ReviewsDetailView()
                SeeMoreView()
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct LocationView: View {
    var body: some View {
        AddressView()
        MapView()
        DirectionView()
            .padding(.bottom, 15)
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
                    .frame(maxWidth: .infinity, maxHeight: 280, alignment: .center)
            case .success(let image):
                image.resizable()
                    .frame(maxWidth: .infinity, maxHeight: 280, alignment: .center)
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
        VStack {
            Text("HaiDiLao HotPot Richmond")
                .bold()
                .font(.title)
                .padding(.horizontal, 15)
            Text("Chinese • Hotpot")
                .font(.body)
                .foregroundColor(Color.black)
                .padding(.horizontal, 15)
        }
    }
}

struct DetailsView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 30){
            VStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .shadow(radius: 3)
                Text("4.3")
                    .font(.subheadline)
                    .foregroundColor(darkGray)
            }
            VStack {
                //Image("comment")
                Image(systemName: "text.bubble.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .scaledToFit()
                    .shadow(radius: 3)
                Text("345")
                    .font(.subheadline)
                    .foregroundColor(darkGray)
            }
            VStack {
                //Image("money2")
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .shadow(radius: 3)
                Text("$$$")
                    .font(.subheadline)
                    .foregroundColor(darkGray)
            }
            VStack {
                Image(systemName: "clock.badge.exclamationmark.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .shadow(radius: 3)
                Text("Close at\n11:00 PM")
                    .font(.subheadline)
                    .foregroundColor(darkGray)
            }
        }
    }
}

struct GetReadyView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Get Ready")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Menu")
                        .font(.headline)
                    Text("Browse for your favourite dish!")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 15)
                .padding(.leading, 90)
                .background(lightGray)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                .padding(.top, 15)
                HStack {
                    Image("menu2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 15)
                    Spacer()
                }
            }
            .shadow(radius: 5)
            
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Reserve")
                        .font(.headline)
                    Text("Call to secure your spots!")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 15)
                .padding(.leading, 90)
                .background(lightGray)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                .padding(.top, 15)
                HStack {
                    Image("call")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 15)
                    Spacer()
                }
            }
            .shadow(radius: 5)
        }
        .padding(.horizontal, 15)
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
            .padding(.bottom, 1)
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
            .cornerRadius(10)
            .padding(.horizontal, 15)
    }
}

struct DirectionView: View {
    var body: some View {
        Button("Get Directions", action: {
            print("directions")
        })
        .padding(11)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 15)
        .shadow(radius: 5)
    }
}

struct ReviewsTitleView: View {
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

struct ReviewsDetailView: View {
    var body: some View {
        LazyVStack {
            ForEach(0 ... 5, id: \.self) { _ in
                ReviewsView()
            }
        }
    }
}

struct SeeMoreView: View {
    var body: some View {
        Button("See More on Google", action: {
            print("press")
        })
        .padding(11)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 15)
        .shadow(radius: 5)
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView()
    }
}
