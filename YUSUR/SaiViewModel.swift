//
//  SaiViewModel.swift
//  YUSUR
//
//  Created by shaden  on 29/06/1446 AH.
//
import SwiftUI

class SaiViewModel: ObservableObject {
    @Published var currentRound: Int = 0 // Current number of rounds
    @Published var isCompleted: Bool = false // To check if the counter has completed
    @Published var selectedIndex: Int = 0 // Track selected dua in the TabView

    let progressSteps = ["Ihram", "Tawaf", "Sa'i", "Hair Trimming"] // List of steps with new order
    let duas = [
        "God is great, God is great, God is great, there is no god but God alone with no partner, to Him belongs dominion and to Him is praise, and He is capable of all things. There is no god but God alone. He fulfilled His promise, gave victory to His servant, and defeated the parties alone",
        "Oh God, You are A generous pardon. You love forgiveness, so forgive me.",
        "There is no god but God, He alone has no partner. To Him belongs dominion, and to Him is praise. He gives life and causes death, and He is capable of all things. There is no god but God alone. He has fulfilled His promise, given victory to His servant, and defeated the parties alone.",
        "Oh God, you are my Lord, there is no god but You. You created me and I am your servant, and I abide by Your covenant and promise as much as I can. I seek refuge in You from the evil of what I have done. I acknowledge Your grace upon me. I confess to you my sin, so forgive me, for He does not forgive sins."
    ]
    
    func incrementRound() {
        if currentRound < 7 {
            currentRound += 1
        }
        if currentRound == 7 {
            isCompleted = true
        }
    }
}
