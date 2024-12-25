//
//  Untitled.swift
//  YUSUR
//
//  Created by shaden  on 24/06/1446 AH.
//
import SwiftUI

struct DuaView: View {
    let duas = [
        "O Allah, all praise is for You Alone. You have beautified my creation and adorned me with hair. Make this (act of hair trimming) a purification and blessing for me, forgive my sins, and accept my worship.",
        "O Allah, guide me and make me steadfast in my faith, and forgive my sins, and grant me success in all my affairs.",
        "O Allah, to You belongs all praise for the completion of blessings and the perfection of Your grace. O Allah, make me among those You are pleased with, forgive them, and have written for them the full reward of Umrah.",
        "O Allah, to You belongs all praise. You have beautified my creation and adorned my hair. Make it a source of purity and blessing for me. Forgive my sins and accept my worship."
    ]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<duas.count, id: \.self) { index in
                    VStack {
                        Spacer()
                        
                        Text(duas[index])
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                    }
                    .tag(index)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white) // Optional: Add background color
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Custom dots
            .frame(height: 400)
            
            // Custom Dots
            HStack(spacing: 8) {
                ForEach(0..<duas.count, id: \.self) { index in
                    Circle()
                        .fill(selectedIndex == index ? Color.gray : Color.secondary.opacity(0.4))
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = index
                            }
                        }
                }
            }
            .padding(.bottom)
        }
        .padding()
    }
}

struct DuaView_Previews: PreviewProvider {
    static var previews: some View {
        DuaView()
    }
}
