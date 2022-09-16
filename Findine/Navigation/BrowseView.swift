//
//  BrowseView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        BrowseHeaderView()
        LazyVStack {
            ForEach(0 ... 4, id: \.self) { _ in
                ReviewsView()
            }
        }
    }
}

struct BrowseHeaderView: View {
    var body: some View {
        VStack {
            Text("Browse")
                .bold()
                .font(.title2)
            
            HStack {
                Text("45 Places Nearby")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {print("button pressed")}) {
                    Image(systemName: "slider.horizontal.3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .center)
                }
                .padding(9)
                .background(lightGray)
                .foregroundColor(Color.black)
                .cornerRadius(23)
                
                Button(action: {print("button pressed")}) {
                    HStack(spacing: 5) {
                        Text("Sort By")
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                        Image(systemName: "arrow.down")
                            .foregroundColor(Color.black)
                    }
                    .padding(10)
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
