//
//  EventsNavigationTab.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

enum EventsTab {
    case inPerson
    case online
    case all
}

struct EventsNavigationTab: View {
    
    @State var isShowingDetailView = false
    @State private var selectedTab: EventsTab = .all
    
    var body: some View {
        VStack {
            Text("Events")
            Picker("", selection: $selectedTab) {
                
                Text("In Person").tag(EventsTab.inPerson)
                Text("All").tag(EventsTab.all)
                Text("Online").tag(EventsTab.online)
            }
            .pickerStyle(.segmented)

            Spacer()
            
            PrimaryButton(title: "Show Politics Quiz") {
                self.isShowingDetailView = true
            }
            .background(Color.red)
            .fullScreenCover(isPresented: $isShowingDetailView) {
                NavigationView {
                    QuizView(isShowingSelf: $isShowingDetailView, question: PoliticalLeaningsQuestion.getFirst())
                }
            }
            
            Spacer()
        }
        .onChange(of: selectedTab) { tab in
            switch tab {
            case .inPerson:
                print("In Person")
                
            case .online:
                print("online")
                
            case .all:
                print("all")
            }
        }
    }
}

// MARK: - Preview

struct EventsNavigationTab_Previews: PreviewProvider {
    static var previews: some View {
        EventsNavigationTab()
    }
}
