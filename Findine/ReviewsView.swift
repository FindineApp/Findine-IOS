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
                            .frame(width: 70, height: 70, alignment: .center)
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
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Peter Na")
                        .bold()
                        .font(.headline)
                    RatingView(rating: .constant(4.2), maxRating: 5)
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                Text("A week ago")
                    .font(.subheadline)
                    .foregroundColor(darkGray)
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            
            Text("Great place to eat at, would come back here again")
                .font(.subheadline)
                .foregroundColor(darkGray)
                .padding(.bottom, 30)
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
