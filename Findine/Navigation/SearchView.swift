//
//  SearchView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .searchable(text: $searchText, prompt:"eg. Korean, Italian, Pizza")
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
