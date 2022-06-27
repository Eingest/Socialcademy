//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 27.06.22.
//

import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            PostsList()
        }
    }
}
