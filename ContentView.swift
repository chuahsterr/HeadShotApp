//
//  ContentView.swift
//  HeadShot
//
//  Created by Chris Chuah on 6/12/25.
//

import SwiftUI

struct ContentView: View {
  
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
//        appearance.shadowImage = nil
//        appearance.shadowColor = nil

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().isTranslucent = false
    }


    var body: some View {
        TabView {
            LoginScreenView()
                
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BookView()
            
                .tabItem {
                    Label("Book", systemImage: "calendar")
                }
           
            Text("Profile")
                .tabItem {
                    Label("HeadShots", systemImage: "person.crop.square.badge.camera")
                }
        }
    }
}


#Preview {
    ContentView()
}
