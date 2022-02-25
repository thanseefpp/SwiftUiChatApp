//
//  ChatAppSwfitUiApp.swift
//  ChatAppSwfitUi
//
//  Created by THANSEEF on 22/02/22.
//

import SwiftUI
import Firebase

@main
struct ChatAppSwfitUiApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
