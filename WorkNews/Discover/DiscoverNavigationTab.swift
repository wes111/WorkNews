//
//  DiscoverNavigationView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct DiscoverNavigationTab: View {
    
    init() {
        setUpNavBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            DiscoverView()
                .navigationTitle("WorkerNews")
            
        }
        // https://developer.apple.com/forums/thread/665369
        // This fixes incorrect popping of view when a published
        // var in the viewModel updates.
        .navigationViewStyle(.stack)
    }
    
    // MARK: - Helper Functions

    func setUpNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .red
        navBarAppearance.titleTextAttributes =
            [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes =
            [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}

struct DiscoverNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverNavigationTab()
    }
}
