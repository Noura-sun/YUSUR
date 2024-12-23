//
//  Dua.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//
import Foundation
import SwiftData

@Model
class Dua: Identifiable {
    @Attribute(.unique) var id: UUID = UUID();       var arabicText: String // Arabic text of the Dua
       var category: String // The category the Dua belongs to (e.g., "الإحرام")
       
       init(arabicText: String, category: String) {
           self.arabicText = arabicText
           self.category = category
       }
}
