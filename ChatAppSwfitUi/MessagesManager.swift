//
//  MessagesManager.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 23/02/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager : ObservableObject {
    @Published private(set) var messages : [Message] = []
    @Published private(set) var lastMessageId = ""
    //created a variable to access the db
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Error decoding document into message : \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            // optional binding
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text:String) {
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        }catch{
            print("Error adding message to Firestore :\(error)")
        }
    }
}

