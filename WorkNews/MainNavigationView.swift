//
//  MainNavigationView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

struct MainNavigationView: View {
    
    var body: some View {
        
        TabView {
            EventsNavigationTab()
                .tabItem {
                    Label("Events", systemImage: "list.dash")
                }
            
            Text("Voting")
                .tabItem {
                    Label("Voting", systemImage: "person.text.rectangle")
                }
            
            Text("Feed")
                .tabItem {
                    Label("Feed", systemImage: "square.and.pencil")
                }
            
            DiscoverNavigationTab()
                .tabItem {
                    Label("Resources", systemImage: "books.vertical")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
