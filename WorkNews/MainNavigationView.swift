//
//  MainNavigationView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

struct MainNavigationView: View {
    
    init() {
        setUpNavBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            DiscoverView()
                .navigationTitle("WorkerNews")
        }
        
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

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
