//
//  PlacesView.swift
//  Findine
//
//  Created by Peter Na on 2022-09-15.
//

import SwiftUI

struct PlacesView: View {
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                AsyncImage(url: URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/16/a5/b9/e9/photo1jpg.jpg")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 140, alignment: .center)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 140, alignment: .center)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .frame(maxWidth: .infinity, maxHeight: 140)
                        
                    @unknown default:
                        EmptyView()
                    }
                }
                .cornerRadius(5)
                .padding(.bottom, 5)
            
                VStack {
                    Spacer()
                    HStack {
                        AsyncImage(url: URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/16/a5/b9/e9/photo1jpg.jpg")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 50, height: 50, alignment: .center)
                            case .success(let image):
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                            case .failure:
                                Image(systemName: "photo")
                                    .frame(width: 50, height: 50)
                                
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .cornerRadius(50)
                        .shadow(radius: 5)
                        .padding(.leading, 15)
                        .padding(.bottom, 15)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 140)
            }
            
            HStack(spacing: 10) {
                Text("HaiDiLao HotPot Richmond")
                    .bold()
                    .font(.headline)
                Spacer()
                Text("700 m")
                    .font(.footnote)
            }
            
            HStack(alignment: .center, spacing: 1) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 11, height: 11)
                Text("4.5")
                    .font(.footnote)
                    .padding(.trailing, 5)
                Text("(453)")
                    .font(.footnote)
                Spacer()
                Text("Chinese • Hotpot")
                    .font(.footnote)
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
