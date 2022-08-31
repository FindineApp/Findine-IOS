//
//  ContentView.swift
//  Findine
//
//  Created by Peter Na on 2022-08-31.
//

import SwiftUI
import MapKit

public var themeColor = Color(red: 0.9647, green: 0.4235, blue: 0.2706)

struct ContentView: View {
    
    var body: some View{
    
        TabView {
            FindView()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            BrowseView()
                .tabItem() {
                    Image(systemName: "fork.knife")
                    Text("Browse")
                }
            SearchView()
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            SettingsView()
                .tabItem() {
                    // systemName: gear
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .accentColor(themeColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
