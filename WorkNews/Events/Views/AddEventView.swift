//
//  AddEventView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct AddEventView: View {
    
    @FocusState private var focusedField: EventField?
    @State var userText: String = ""
    @State var userDate = Date()
    @State var isInPerson = false
    @State var isVirtual = false
    let stateFieldWidth = (UIScreen.width * 0.55)
    
    var body: some View {
        ZStack(alignment: .top) {
            
            HStack {
                Button {
                    print("Reset tapped.")
                } label: {
                    Text("Reset")
                }
                
                Spacer()
                
                Button {
                    print("close pressed.")
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding(.horizontal)
            
            VStack {
                
                Text("Create Event")
                    .font(.create(Gotham.bold(size: 28)))
                
                ScrollView {
                    VStack(spacing: 30) {
                        
                        NextFocusField(EventField.title, userText: $userText, _focusedField)
                        
                        NextFocusField(EventField.description, userText: $userText, _focusedField)
                        
                        
                        HStack(spacing: 15) {
                            
                            Toggle(isOn: $isInPerson) {
                                Text("In-person")
                            }
                            .toggleStyle(CheckBoxStyle())
                            
                            Toggle(isOn: $isVirtual) {
                                Text("Virtual")
                            }
                            .toggleStyle(CheckBoxStyle())
                            
                            Spacer()
                        }
                        
                        // If in-person, show address fields.
                        if isInPerson {
                            
                            NextFocusField(EventField.streetAddress, userText: $userText, _focusedField)
                            
                            HStack(alignment: .top, spacing: 25) {
                                
                                NextFocusField(EventField.unitAddress, userText: $userText, _focusedField)
                                
                                NextFocusField(EventField.city, userText: $userText, _focusedField)
                            }
                            
                            HStack(alignment: .top, spacing: 25) {
                                
                                NextFocusField(EventField.zipcode, userText: $userText, _focusedField)
                                
                                MenuField(field: EventField.state,
                                          menuItems: USState.allCases.map { $0.name },
                                          menuItemWidth: stateFieldWidth)
                                .frame(width: stateFieldWidth)
                            }
                        }
                        
                        DateField(EventField.beginDate, userDate: $userDate)
                        
                        DateField(EventField.endDate, userDate: $userDate)
                        
                        NextFocusField(EventField.organizer, userText: $userText, _focusedField)
                        
                        NextFocusField(EventField.details, userText: $userText, _focusedField)
                        
                        NextFocusField(EventField.contactEmail, userText: $userText, _focusedField)
                    }
                }
                .padding()
            }
        }
        .background(Color.deepRed)
        .foregroundColor(.white)
        .font(.create(Gotham.light(size: 12)))
    }
}

// MARK: - Preview

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}

