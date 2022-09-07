//
//  RatingView.swift
//  Findine
//
//  Created by Peter Na on 2022-09-06.
//

import SwiftUI

struct RatingView: View {
    
    struct ClipShape: Shape {
        let width: Double
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }

    @Binding var rating: Double
    let maxRating: Int

    init(rating: Binding<Double>, maxRating: Int) {
        self.maxRating = maxRating
        self._rating = rating
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star.fill"))
                    .foregroundColor(lightGray)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(themeColor)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating))
                )
            }
        )
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4.5), maxRating: 5)
    }
}
