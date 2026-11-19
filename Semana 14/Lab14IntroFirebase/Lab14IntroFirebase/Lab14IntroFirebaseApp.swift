//
//  Lab14IntroFirebaseApp.swift
//  Lab14IntroFirebase
//
//  Created by oscarolano15@gmail.com on 19/11/26.
//

import SwiftUI
import FirebaseCore

@main
struct Lab14IntroFirebaseApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
