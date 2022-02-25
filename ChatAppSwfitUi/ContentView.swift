//
//  ContentView.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                //we can scroll this area.
                ScrollViewReader { proxy in
                    ScrollView {
                        //calling the messageArray to loop throug the array.
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top,10)
                    .background(.white)
                .cornerRadius(30,corners: [.topLeft,.topRight])
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
                }
                
            }
            .background(Color("Peach"))
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
