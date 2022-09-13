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
                    .padding(.bottom, 10)
                DetailsView()
                    .padding(.bottom, 20)
                GetReadyView()
                    .padding(.bottom, 20)
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
            .padding(.bottom, 20)
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
        ZStack {
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
            
            HStack {
                VStack {
                    Spacer()
                    AsyncImage(url: URL(string: "https://media.glassdoor.com/sqll/2163971/haidilao-hotpot-china-squarelogo-1560863363446.png")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 75, height: 75, alignment: .center)
                        case .success(let image):
                            image.resizable()
                                .frame(width: 75, height: 75, alignment: .center)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75, alignment: .center)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .cornerRadius(30)
                    .shadow(radius: 5)
                }
                .padding(.bottom, 15)
                Spacer()
            }
            .padding(.leading, 15)
        }
        
    }
     
}

struct TitleView: View {
    var body: some View {
        HStack {
            Text("HaiDiLao HotPot Richmond")
                .bold()
                .font(.title)
                .padding(.horizontal, 15)
            Spacer()
        }
    }
}

struct DetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            
            HStack {
                Text("Chinese • Hotpot")
                    .bold()
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
            }
            
            HStack {
                HStack(alignment: .center, spacing: 1) {
                    Image(systemName: "star.fill")
                    Text("4.3")
                }
                Text("•")
                Text("436 reviews")
                Spacer()
            }
            .font(.subheadline)
            
            HStack {
                Text("$$$")
                Text("•")
                Text("Closes at 11:00 PM")
                Spacer()
            }
            .font(.subheadline)
        }
        .padding(.horizontal, 15)
    }
}

struct GetReadyView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Get Ready")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 15)
                Spacer()
            }
            
            HStack(alignment: .center) {

                Image("menu3")
                    .resizable()
                    .frame(width:60, height: 60)
                    .cornerRadius(5)
                    .padding(.horizontal, 15)

                VStack(alignment: .leading) {
                    Text("Menu")
                        .font(.headline)
                    Text("Browse for your favourite dish!")
                        .font(.subheadline)
                }
                .padding(.vertical, 18)
                .foregroundColor(Color.black)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .background(lightGray)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            
            HStack(alignment: .center) {

                Image("phone2")
                    .resizable()
                    .frame(width:60, height: 60)
                    .cornerRadius(5)
                    .padding(.horizontal, 15)

                VStack(alignment: .leading) {
                    Text("Reserve")
                        .font(.headline)
                    Text("Call to secure your spots!")
                        .font(.subheadline)
                }
                .padding(.vertical, 18)
                .foregroundColor(Color.black)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .background(lightGray)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            
        }
        
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
            ForEach(0 ... 4, id: \.self) { _ in
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
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 1))
        .padding(.horizontal, 15)
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView()
    }
}
