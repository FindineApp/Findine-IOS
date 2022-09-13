//
//  FilterView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack {
            FilterTitleView()
            DiningTypeView()
            Spacer()
        }
    }
}

struct FilterTitleView: View {
    var body: some View {
        HStack {
            
            Text("Filter")
                .bold()
                .font(.title2)
            
        }
    }
}

struct DiningTypeView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Dining Type")
                    .bold()
                    .font(.title3)
                    Spacer()
            }
            
            HStack {
                Button(action: {print("button pressed")}) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 30, alignment: .center)
                            .foregroundColor(.black)
                        Text("Restaurant")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                Button(action: {print("button pressed")}) {
                    Image(systemName: "slider.horizontal.3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                }
            }
            
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
