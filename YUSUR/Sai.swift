//
//  saia.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 11/06/1446 AH.
//
import SwiftUI

struct Sai: View {
    var body: some View {
        VStack {
            //Navigation Bar
            HStack{
                Spacer()
                Text ("دليل العمرة")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Image("kaaba 1")
                                  
            }
            
        }
        .padding()
    }
}

#Preview {
    Sai()
}

