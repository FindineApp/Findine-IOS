//
//  ReviewsView.swift
//  Findine
//
//  Created by Peter Na on 2022-09-06.
//

import SwiftUI

struct ReviewsView: View {
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/16/a5/b9/e9/photo1jpg.jpg")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 60, alignment: .center)
                            .cornerRadius(30)
                    case .success(let image):
                        image.resizable()
                            .frame(width: 60, height: 60, alignment: .center)
                            .cornerRadius(30)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .center)
                            .cornerRadius(30)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack {
                    Text("Peter Na")
                        .bold()
                        .font(.headline)
                    RatingView(rating: 4.2, maxRating: 5)
                        .frame(width: 100, height: 20, alignment: .center)
                }
                
                Spacer()
                
                Text("A week ago")
                    .font(.subheadline)
                
            }
            .padding(.horizontal, 15)
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
