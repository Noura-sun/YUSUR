//
//  Sai.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 18/06/1446 AH.
//
import SwiftUI

struct Sai: View {
    @State private var counter = 0 //  to track the count
    @State private var selectedTab = 0 //  tracking the tab for swipe

    var body: some View {
        VStack {
            // Navigation Bar
            HStack {
                Spacer()
                Text("دليل العمرة")
                    .font(.title)
                    .fontWeight(.bold)
                Image("kaaba 1")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding()
            Divider()

            // Progress Bar
            HStack(spacing: 10) {
                Text("احرام")
                    .font(.caption)
                    .padding(10)
                    .background(Color.brown.opacity(0.3))
                    .cornerRadius(10)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)

                Text("الطواف")
                    .font(.caption)
                    .padding(10)
                    .background(Color.brown.opacity(0.3))
                    .cornerRadius(5)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)

                Text("السعي")
                    .font(.caption)
                    .padding(10)
                    .background(Color.brown)
                    .cornerRadius(5)
            }
            .padding(.horizontal)

            // Main Content
            ScrollView {
                VStack(spacing: 30) { // Set spacing to 0 to remove space between elements
                    Text("السعي (بين الصفا والمروة):")
                        .font(.headline)
                        .multilineTextAlignment(.center)

                    Text("المشي من الصفا إلى المروة شوط، والعودة من المروة إلى الصفا شوط آخر. أكمل سبع أشواط، تبدأ من الصفا وتنتهي عند المروة.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing])

                    // Counter Button
                    Button(action: {
                        if counter < 7 {
                            counter += 1
                            print("Count: \(counter)")
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.brown)
                                .frame(width: 170, height: 170)

                            Text(counter == 0 ? "+" : "\(counter)") // "+" initially, then numbers
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }

                
                    Text(counter == 0 ? "ابدا السعي" : (counter == 7 ? "اكتمل السعي!" : ""))
                        .font(.title)

                    // Swipeable Circle
                    TabView(selection: $selectedTab) {
                        VStack {
                            // First text screen
                            Text("اللهم إني أسالك الجنة وما قرب إليها من قول وعمل، وأعوذ بك من النار، وما قرب إليها من قول وعمل.")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .tag(0)

                        VStack {
                            // Second text screen
                            Text("الله أكبر، الله أكبر، الله أكبر، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير، لا إله إلا الله وحده، أنجز وعده، ونصر عبده.")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .tag(1)
                    }
                    .frame(height: 250)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                    // Swipeable Circle Indicators
                    HStack(spacing: 10) {
                        ForEach(0..<2) { index in
                            Circle()
                                .fill(index == selectedTab ? Color.brown : Color.gray)
                                .frame(width: 10, height: 10)
                        }
                    }

                }
                .padding([.leading, .trailing]) // Add horizontal padding to content
            }
        }
       
    }
}

#Preview {
    Sai()
}
