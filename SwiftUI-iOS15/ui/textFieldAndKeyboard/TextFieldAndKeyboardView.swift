//
//  TextFieldAndKeyboardView.swift
//  Test-iOS15
//
//  Created by Rafael Fernandez Alvarez on 25/6/21.
//

import SwiftUI

struct TextFieldAndKeyboardView: View {
    @State var name: String = ""
    @State var surname: String = ""
    @State var address: String = ""
    
    @State var lastSubmit: String = "None"
    @FocusState var focus: OrderField?
    
    enum OrderField: Int, Hashable, CaseIterable {
        case name
        case surname
        case address
        
        func next() -> OrderField? {
            let all = Self.allCases
            let idx = all.firstIndex(of: self)!
            let next = all.index(after: idx)
            if next == all.endIndex {
                return nil
            } else {
                return all[next]
            }
        }
        
        func previous() -> OrderField? {
            let all = Self.allCases
            let idx = all.firstIndex(of: self)!
            let previous = all.index(before: idx)
            if previous < 0 {
                return nil
            } else {
                return all[previous]
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Last text submit: \(lastSubmit)")
            TextField("Name", text: $name)
                .onSubmit {
                    lastSubmit = name
                    if let focus = focus {
                        self.focus = focus.next()
                    }
                }
                .focused($focus, equals: .name)
                .submitLabel(.next)
            TextField("Surname", text: $surname)
                .onSubmit {
                    lastSubmit = surname
                    if let focus = focus {
                        self.focus = focus.next()
                    }
                }
                .focused($focus, equals: .surname)
                .submitLabel(.next)
            TextField("Address", text: $address)
                .onSubmit {
                    lastSubmit = address
                }
                .focused($focus, equals: .address)
                .submitLabel(.done)
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .frame(maxWidth: .infinity)
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button {
                    if let focus = focus {
                        self.focus = focus.previous()
                    }
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .disabled(!hasPreviousTextField)
                Button {
                    if let focus = focus {
                        self.focus = focus.next()
                    }
                } label: {
                    Image(systemName: "chevron.forward")
                }
                .disabled(!hasNextTextField)
                Spacer()
            }
        }
        .navigationBarTitle("textFieldAndKeyboard", displayMode: .inline)
    }
    
    var hasPreviousTextField: Bool {
        if let focus = focus, focus.previous() != nil {
            return true
        } else {
            return false
        }
    }
    
    var hasNextTextField: Bool {
        if let focus = focus, focus.next() != nil {
            return true
        } else {
            return false
        }
    }
}

struct TextFieldAndKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextFieldAndKeyboardView()
        }
    }
}
