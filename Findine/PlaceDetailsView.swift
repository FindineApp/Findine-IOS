//
//  PlaceDetailsView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct PlaceDetailsView: View {
    
    var body: some View {
        VStack {
            ImageSliderView()
                .frame(maxWidth: .infinity, maxHeight: 210)
            TitleView()
            HoursView()
            RateView()
            MoreView()
            MenuView()
            PhoneView()
            Spacer()
        }
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
                    .frame(maxWidth: .infinity, maxHeight: 210, alignment: .center)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        
    }
     
}

struct TitleView: View {
    
    var body: some View {
        HStack {
            Text("HaiDiLao Hotpot Richmond")
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
                .foregroundColor(themeColor)
                .font(.headline)
                .padding(.leading, 15)
            Text("Closes at 11:00 PM")
                .foregroundColor(Color.gray)
            Spacer()
        }
    }
}

struct RateView: View {
    var body: some View {
        HStack {
            Text("4.7")
                .padding(.leading, 15)
            Text("672 Reviews")
            Spacer()
        }
        .foregroundColor(Color.gray)
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
    }
}

struct MenuView: View {
    var body: some View {
        HStack {
            Text("Menu: https://haidilao.com")
                .padding(.leading, 15)
                .foregroundColor(Color.gray)
            Spacer()
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
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView()
    }
}
