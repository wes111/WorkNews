//
//  MenuField.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct MenuField<T: UserFillable>: View {
    
    @State private var menuIsVisible = false
    @State var userSelection = ""
    let field: T
    let menuItems: [String]
    let menuItemWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            
            UserFieldHeaders(title: field.title, subtitle: field.subtitle)
            
            VStack {
                Button {
                    self.menuIsVisible.toggle()
                } label: {
                    HStack {
                        if userSelection.isEmpty {
                            Text(field.defaultText ?? "")
                        } else {
                            Text(userSelection)
                        }
                        Spacer()
                        Image(systemName: menuIsVisible ? "chevron.up" : "chevron.down")
                    }
                    .padding(16)
                }
                .padding(.top, 2)
                
                if menuIsVisible { // Display the drop-down menu.
                    VStack {
                        Divider()
                            .padding(.top, -10)
                        
                        Picker(selection: $userSelection, label: EmptyView()) {
                            ForEach(menuItems, id: \.self) { item in
                                Text(item)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: menuItemWidth)
                        .clipped()
                        .onTapGesture {
                            self.menuIsVisible.toggle()
                        }
                        .padding(.top, -36)
                        .padding(.bottom, -20)
                    }
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 2)
                .stroke(field.validate(userSelection) ? .black : .red, lineWidth: 2)
            )
        }
    }
}


struct MenuField_Previews: PreviewProvider {
    static var previews: some View {
        MenuField(field: EventField.state,
                  menuItems: USState.allCases.map { $0.name }, menuItemWidth: 150)
    }
}
