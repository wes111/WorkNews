//
//  QuizView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct QuizView<Question: CarouselQuestion>: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var navigationTag: String?
    @State var backButtonColor: Color = .black
    @Binding var isShowingSelf: Bool
    
    let allQuestions: [Question] = Question.allCases as? [Question] ?? []
    var question: Question
    var index: Int {
        return allQuestions.firstIndex(of: question) ?? 0
    }
    
    let successTag = "success"
    let nextViewTag = "nextTag"
    
    let columns = [
        GridItem(.flexible(), spacing: 12, alignment: .leading),
        GridItem(.flexible(), spacing: 12, alignment: .trailing)
    ]
    
    var body: some View {
        VStack {
            addNavigationLinks()
            
            // Close button.
            HStack {
                Spacer()
                Button {
                    isShowingSelf = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.bottom, 28)
            
            // Main Question
            Text(question.rawValue)
                .padding(.bottom, 16)
            
            Text("Select All That Apply")
                .padding(.bottom, 4)
            
            Text(String("\(index + 1)/\(allQuestions.count)"))
                .padding(.bottom, 2)
            
            ProgressView(value: Double(index + 1) / Double(allQuestions.count))
                .frame(width: 150)
                .padding(.bottom, 38)
                .tint(.blue)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(question.tilesInfo, id: \.categoryName) { tileInfo in
                            QuestionTile(tileInfo: tileInfo)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.bottom, 29)
            
            HStack {
                if !question.isFirst { // Hide the button if it is the first.
                    SecondaryButton(buttonColor: $backButtonColor, title: "BACK") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                Spacer()
                PrimaryButton(title: "NEXT") {
                    navigationTag = question.isLast ? successTag : nextViewTag
                }
                .frame(width: 100)
                .background(Color.red)
            }
            .padding(.bottom, 15)
            
            Text("We are collecting you info.")
                .lineSpacing(7)
            
        }
        .padding(20)
        .multilineTextAlignment(.center)
        .navigationBarHidden(true)
    }
    
    // MARK: - Helper Functions
    
    // Adds navigation links for questions and the
    // final success View.
    private func addNavigationLinks() -> some View {
        return Group {
            NavigationLink(
                destination: QuizView(isShowingSelf: $isShowingSelf,
                                      question: question.advance()),
                tag: nextViewTag,
                selection: $navigationTag) { EmptyView() }
            
            NavigationLink(
                destination: QuizSuccessView(isShowingParentView: $isShowingSelf),
                tag: successTag,
                selection: $navigationTag) { EmptyView() }
        }
    }
}

// MARK: - Preview

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(isShowingSelf: .constant(true), question: PoliticalLeaningsQuestion.politician)
    }
}
