//
//  MessageField.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager : MessagesManager
    @State private var message = ""
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
            }label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
        
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder : Text
    @Binding var text : String // Binding means we can change the variable from outside the view
    var editingChanged : (Bool) -> () = { _ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("",text: $text,onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}
