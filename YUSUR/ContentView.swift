//
//  ContentView.swift
//  YUSUR
//
//  Created by Noura  on 10/06/1446 AH.
//Hi im shaden
import SwiftUI
import SwiftData

struct ContentView:  View {
    @Query var DuaaList: [Dua]
    var body: some View {
        VStack{
            Text("Hello")
            List{
                ForEach(DuaaList){ dua in
                    Text(dua.arabicText)
                }
            }
        }
    }
}
