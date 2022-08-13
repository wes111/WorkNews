//
//  QuestionTile.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct QuestionTile: View {
    @State var selected = false
    let tileInfo: TileInfo
    let borderWidth: CGFloat = 4
    
    var body: some View {
        Image(tileInfo.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 100)
            .overlay(TitleOverlay(title: tileInfo.categoryName), alignment: .bottom)
            .padding(borderWidth)
            .border(selected ? tileInfo.borderColor : Color.white,
                    width: selected ? borderWidth : 0)
            .padding(.vertical, 7.5)
            .onTapGesture {
                selected.toggle()
            }
    }
    
    struct TitleOverlay: View {
        let title: String
        
        var body: some View {
            ZStack {
                HStack {
                    Spacer()
                    Text(title)
                    Spacer()
                }
                .frame(height: 16)
            }
            .background(Color.white)
        }
    }
}

struct QuestionTile_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTile( tileInfo: TileInfo(categoryName: "No Fossil Fuels",
                                          imageName: "",
                                          borderColor: .yellow
                                         )
        )
    }
}
