//
//  MessageBubble.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import SwiftUI

struct MessageBubble: View {
    @State private var showTime = false
    var message : Message // calling the model
    var body: some View {
        //  if the message is received it will execute the .leading else .trailing will work.
        VStack(alignment: message.received ? .leading : .trailing){
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(50)
            }
            .frame(maxWidth:300,alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 20)
            }
        }
        .frame(maxWidth:.infinity,alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal,10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "123", text: "Testing my chat app", received: false, timestamp: Date()))
    }
}
