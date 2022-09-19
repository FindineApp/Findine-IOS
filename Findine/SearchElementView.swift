//
//  SearchElementView.swift
//  Findine
//
//  Created by Peter Na on 2022-09-18.
//

import SwiftUI

struct SearchElementView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(7)
                .background(lightGray)
                .cornerRadius(20)
            Text("Hotpot")
                .font(.subheadline)
            Spacer()
        }
        .padding(.bottom, 5)
        
    }
}

struct SearchElementView_Previews: PreviewProvider {
    static var previews: some View {
        SearchElementView()
    }
}
