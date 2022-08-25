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
        
        
        VStack(alignment: .leading, spacing: 0) {
            
            UserFieldHeaders(title: field.title, subtitle: field.subtitle)
                .padding(.bottom, 10)
            
            Button {
                self.menuIsVisible.toggle()
            } label: {
                HStack {
                    
                    Group {
                        if userSelection.isEmpty {
                            Text(field.defaultText ?? "")
                        } else {
                            Text(userSelection)
                        }
                    }
                    
                    Spacer()
                    Image(systemName: menuIsVisible ? "chevron.up" : "chevron.down")
                        .foregroundColor(.softYellow)
                }
            }
            .padding(.bottom, 2)
            .frame(height: 20)
            
            if !menuIsVisible {
                Divider()
                    .frame(height: 1)
                    .overlay(Color.softYellow)
            }
        
            if menuIsVisible { // Display the drop-down menu.
                Picker(selection: $userSelection, label: EmptyView()) {
                    ForEach(menuItems, id: \.self) { item in
                        Text(item)
                            .font(.create(Gotham.light(size: 14)))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: menuItemWidth)
                .clipped()
                .onTapGesture {
                    self.menuIsVisible.toggle()
                }
                .padding(.top, -20)
                .padding(.bottom, -20)
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(field.validate(userSelection) ? Color.softYellow : .red, lineWidth: 1)
                )
            }
        }
        .foregroundColor(.white)
        .font(.create(Gotham.light(size: 14)))
    }
}


struct MenuField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            MenuField(field: EventField.state,
                      menuItems: USState.allCases.map { $0.name }, menuItemWidth: 150)
            Spacer()
        }
        .background(Color.deepRed)
    }
}
