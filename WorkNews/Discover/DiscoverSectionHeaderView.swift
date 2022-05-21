//
//  DiscoverSectionHeaderView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import SwiftUI

struct DiscoverSectionHeaderView: View {
    
    @ObservedObject var model: BooksViewModel
    @State var navButtonIsHidden = true
    let navigationAction: () -> ()
    let title: String
    
    
    var body: some View {
        
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            NavigationLink(destination: BooksListView(bookList: $model.publishedFullList)) {
                Image(systemName: "arrow.forward")
                    .modify(using: .systemForward)
            }
            .simultaneousGesture(TapGesture().onEnded{
                navigationAction()
            })
            // Hide the navigation button until the resource
            // count is received.
            .isHidden(navButtonIsHidden)
            .onChange(of: model.bookCount) { _ in
                navButtonIsHidden = false
            }
        }
        .textCase(nil)
        .foregroundColor(.black)
    }
}

// MARK: - Preview
struct DiscoverSectionHeaderView_Previews: PreviewProvider {
    
    struct DiscoverSectionHeaderViewPreview: View {
        @StateObject private var model = BooksViewModel()
        @State private var resourceCount: Int? = 2
        
        var body: some View {
            DiscoverSectionHeaderView(
                model: model,
                navigationAction: {
                    print("place holder")
                },
                title: "Books")
        }
    }
    
    static var previews: some View {
        DiscoverSectionHeaderViewPreview()
    }
}
