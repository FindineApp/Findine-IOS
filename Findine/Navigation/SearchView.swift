//
//  SearchView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .bold()
                    .font(.title2)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("eg. Korean, Italian, burgers", text: $searchText, onEditingChanged: { isEditing in self.showCancelButton = true }, onCommit: {
                            print("onCommit")
                    }).foregroundColor(Color.gray)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .background(lightGray)
                .cornerRadius(30)
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationBarHidden(true)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
