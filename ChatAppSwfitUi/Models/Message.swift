//
//  Message.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import Foundation

//Identifiable is used for unique items.
//Codable is used for decode and encode the items.
struct Message: Identifiable,Codable {
    var id : String
    var text : String
    var received : Bool
    var timestamp : Date
}
