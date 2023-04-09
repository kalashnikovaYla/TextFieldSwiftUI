//
//  ContentView.swift
//  TextFieldSwiftUI
//
//  Created by sss on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @FocusState var nameIsFocused: Bool
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            TextField("Enter login", text: $text).redTextField().focused($nameIsFocused)
            TextField("Enter password", text: $text).modifier(TextFieldModifier())

            Button {
                nameIsFocused = false
                //hideKeyboard()
            } label: {
                Text("Log in")
            }

        }
        .padding()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension View {
    func redTextField() -> some View {
        modifier(TextFieldModifier())
    }
}


struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
            content
            .textFieldStyle(.roundedBorder)
            .tint(.accentColor)
            .font(.system(size: 24))
            .keyboardType(.decimalPad)
            .padding(.horizontal, 12)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue)
            }
            .foregroundColor(Color.blue)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
  
