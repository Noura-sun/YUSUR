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
    var body: some Scene {
        WindowGroup {
            TawafView()
        }
        .modelContainer(for: Dua.self)
    }
}
