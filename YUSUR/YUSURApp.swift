//
//  YUSURApp.swift
//  YUSUR
//
//  Created by Noura  on 10/06/1446 AH.
//

import SwiftUI
import SwiftData
@main
struct YUSURApp: App {
    
   // seedDuaDataIfNeeded
    var body: some Scene {
        WindowGroup {
//            TawafView()
            ContentView()
        }
        .modelContainer(for: [Dua.self])
    }
}
