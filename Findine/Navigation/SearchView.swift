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
    @FocusState private var keyboardOpen: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Search")
                        .bold()
                        .font(.title2)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("eg. Korean, Italian, burgers", text: $searchText, onEditingChanged: {
                            isEditing in self.showCancelButton = true
                        }, onCommit: {
                                print("onCommit")
                        })
                        .foregroundColor(Color.black)
                        .focused($keyboardOpen)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                                .foregroundColor(Color.gray)
                        }
                        
                        if showCancelButton {
                            Button("Cancel") {
                                self.searchText = ""
                                self.showCancelButton = false
                                self.keyboardOpen = false
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 14, leading: 15, bottom: 14, trailing: 15))
                    .foregroundColor(Color.black)
                    .background(lightGray)
                    .cornerRadius(30)
                    .padding(.bottom, 15)
                    
                    LazyVStack {
                        ForEach(0 ... 12, id: \.self) { _ in
                            SearchElementView()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                .navigationBarHidden(true)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
