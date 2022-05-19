//
//  MagazineCard.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct MagazineCard: View {
    
    let magazine: Magazine
    
    var body: some View {
        magazine.image
            .resizable()
            .frame(width: 51, height: 66)
    }
}

struct MagazineCard_Previews: PreviewProvider {
    static var previews: some View {
        MagazineCard(magazine: Magazine(image: Image(systemName: "magazine.fill")))
    }
}
