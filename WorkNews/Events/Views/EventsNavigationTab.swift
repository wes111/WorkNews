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
    @State var isShowingAddEventView = false
    @State private var selectedTab: EventsTab = .all
    
    var body: some View {
        VStack {
            ZStack {
                Text("Events")
                HStack {
                    Spacer()
                    Button {
                        isShowingAddEventView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .fullScreenCover(isPresented: $isShowingAddEventView) {
                        AddEventView()
                    }
                }
            }
            
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
                    QuizView(isShowingSelf: $isShowingDetailView, question: PoliticsQuiz.getFirst())
                }
            }
            
            Spacer()
        }
        .padding()
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
