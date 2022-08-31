//
//  ContentView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View{
    
        TabView {
            FindView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Home")
                }
            BrowseView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Browse")
                }
            SearchView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Search")
                }
            SettingsView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Settings")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
