//
//  BrowseView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                BrowseHeaderView()
                    .padding(.bottom, 5)
                LazyVStack {
                    ForEach(0 ... 5, id: \.self) { _ in
                        PlacesView()
                    }
                }
                Spacer()
            }
        }
    }
}

struct BrowseHeaderView: View {
    var body: some View {
        VStack {
            Text("Browse")
                .bold()
                .font(.title3)
            
            HStack {
                Text("45 Places Nearby")
                    .bold()
                    .font(.subheadline)
                
                Spacer()
                
                Button(action: {print("button pressed")}) {
                    Image(systemName: "slider.horizontal.3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                }
                .padding(9)
                .background(lightGray)
                .foregroundColor(Color.black)
                .cornerRadius(23)
                
                Button(action: {print("button pressed")}) {
                    HStack(spacing: 5) {
                        Text("Sort By")
                            .bold()
                            .font(.footnote)
                            .foregroundColor(Color.black)
                        Image(systemName: "arrow.down")
                            .foregroundColor(Color.black)
                    }
                    .padding(9)
                    .background(lightGray)
                    .cornerRadius(20)
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
