//
//  BooksListView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import SwiftUI

struct BooksListView: View {
    
    @ObservedObject var model: BooksViewModel

    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(alignment: .top) {
                VStack {
                    ForEach(0..<model.publishedFullList.count.getThird(position: 1), id:\.self) { index in
                        BookCard(book: model.publishedFullList[index])
                            .padding(EdgeInsets(
                                top: 10,
                                leading: 10,
                                bottom: 10,
                                trailing: 0))
                    }
                }
                VStack {
                    ForEach(model.publishedFullList.count.getThird(position: 1)..<model.publishedFullList.count.getThird(position: 2),
                            id:\.self) { index in
                        BookCard(book: model.publishedFullList[index])
                            .padding(EdgeInsets(
                                top: 10,
                                leading: 10,
                                bottom: 10,
                                trailing: 0))
                    }
                }
                
                VStack {
                    ForEach(model.publishedFullList.count.getThird(position: 2)..<model.publishedFullList.count,
                            id:\.self) { index in
                        BookCard(book: model.publishedFullList[index])
                            .padding(EdgeInsets(
                                top: 10,
                                leading: 10,
                                bottom: 10,
                                trailing: 0))
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct BooksListView_Previews: PreviewProvider {
    
    struct BooksListViewPreview: View {
        @ObservedObject var model = BooksViewModel()
        
        var body: some View {
            BooksListView(model: model)
        }
    }
    
    static var previews: some View {
        BooksListViewPreview()
    }
}
