//
//  DiscoverMagazinesScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverMagazinesScrollView: View {
    let magazinesArray =
    [
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill")),
        Magazine(image: Image(systemName: "magazine.fill"))
    ]
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(magazinesArray) { magazine in
                    MagazineCard(magazine: magazine)
                        .padding(.leading, 10)
                }
            }
        }
    }
}

struct DiscoverMagazinesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMagazinesScrollView()
    }
}
