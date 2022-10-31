//
//  LearningSwiftAppApp.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import SwiftUI

@main
struct LearningSwiftAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(Module())
        }
    }
}
