import SwiftUI

struct TawafView: View {
    @State private var currentRound: Int = 0 // Current number of rounds
    @State private var isCompleted: Bool = false // To check if the counter has completed
    @State private var selectedIndex: Int = 0 // Added for tracking the current dua index
    @State private var showHelpModal: Bool = false // State to show or hide the help modal

    let progressSteps = ["Ihram", "Tawaf", "Sa'i", "End Ihram"] // List of steps with new order
    let duas = [
        "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire",
        "Glory be to Allah, all praise is due to Allah, there is no god but Allah, and Allah is the Greatest",
        "O Allah, You are Pardoning and Generous, and You love to pardon, so pardon me",
        "O Allah, I ask You for pardon and well-being in this world and the Hereafter"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // Add the question mark button at the top
                    HStack {
                        Button(action: {
                            showHelpModal = true // Show the help modal
                        }) {
                            Image(systemName: "questionmark.circle")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    .padding(.top, 20)

                    // Steps bar with connecting line
                    HStack(spacing: 0) {
                        ForEach(progressSteps.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                // Step Block
                                Text(progressSteps[index])
                                    .font(.custom("Amiri-Bold", size: 12))
                                    .foregroundColor(index == 0 || index == 1 ? .white : .black)
                                    .frame(width: 64, height: 41)
                                    .background(index == 0 || index == 1 ? Color(hex: "#79634B") : (index == 2 || index == 3 ? Color(hex: "#E6D9CA") : Color.gray.opacity(0.3)))
                                    .cornerRadius(6)

                                // Connecting Line (only if not the last step)
                                if index < progressSteps.count - 1 {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(index == 0 ? Color(hex: "#79634B") : Color(hex: "#E6D9CA"))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    // Tawaf description
                    ScrollView {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Tawaf")
                                .font(.custom("Amiri-Regular", size: 20))
                                .padding(.bottom, 12)
                                .padding(.top, 12)
                            Text("""
                            Begin Tawaf at the Black Stone.
                            Say "Bismillah, Allahu Akbar".
                            If you can touch the Black Stone, do so. If not, gesture towards it while continuing Tawaf. Continue with prayers and supplications.
                            """)
                            .font(.custom("Amiri-Regular", size: 16))
                            .lineSpacing(2)
                            Spacer().frame(height: 30)
                        }
                        .padding(.horizontal, 18)
                        .padding(.top, 18)

                        // Round Counter with Centered Number
                        VStack(spacing: 14) {
                            ZStack {
                                GeometryReader { geometry in
                                    // Circle background
                                    Circle()
                                        .fill(
                                            currentRound == 0 ? Color("Color 10"):
                                            currentRound == 1 ? Color("Color 3") :
                                            currentRound == 2 ? Color("Color 4") :
                                            currentRound == 3 ? Color("Color 5") :
                                            currentRound == 4 ? Color("Color 6") :
                                            currentRound == 5 ? Color("Color 7") :
                                            currentRound == 6 ? Color("Color 8") :
                                            currentRound == 7 ? Color("Color 9") :
                                            Color.clear
                                        )
                                        .frame(width: 170, height: 170)

                                    // Number in the center
                                    Text("\(currentRound)")
                                        .font(.system(size: 48))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 5)
                                }
                                .frame(width: 170, height: 160)
                            }

                            // Display message based on the current round count
                            Text(currentRound == 0 ? "Start Round" : (currentRound == 7 ? "Tawaf Completed!" : ""))
                                .font(.custom("Amiri-Regular", size: 16))
                                .foregroundColor(.black)
                                .padding(.top, 10)
                        }

                        // Buttons inside rectangle container
                        HStack(spacing: 30) {
                            Button(action: {
                                if currentRound > 0 {
                                    currentRound -= 1
                                    isCompleted = false
                                }
                            }) {
                                Image(systemName: "minus")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color("Color 3"))
                                    .frame(width: 50, height: 20)
                                    .cornerRadius(25)
                            }

                            Button(action: {
                                if currentRound < 7 {
                                    currentRound += 1
                                    if currentRound == 7 {
                                        isCompleted = true
                                    }
                                }
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color("Color 1"))
                                    .fontWeight(.bold)
                                    .frame(width: 50, height: 20)
                                    .cornerRadius(25)
                            }
                        }
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)

                        VStack {
                            TabView(selection: $selectedIndex) {
                                ForEach(0..<duas.count, id: \.self) { index in
                                    VStack {
                                        Text(duas[index])
                                            .font(.custom("Amiri-Regular", size: 17))
                                            .multilineTextAlignment(.center)
                                            .padding(.top, -70)
                                    }
                                    .tag(index)
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: 180)
                            // Custom Dots
                            Group {
                                HStack(spacing: 8) {
                                    ForEach(0..<duas.count, id: \.self) { index in
                                        Circle()
                                            .fill(selectedIndex == index ? Color.gray : Color.secondary.opacity(0.4))
                                            .frame(width: 6, height: 10)
                                            .onTapGesture {
                                                withAnimation {
                                                    selectedIndex = index
                                                }
                                            }
                                    }
                                }
                                .padding(.top, -90) // Reduced spacing between duas and dots
                                .padding(.bottom)
                            }
                        }
                        .padding()
                        Spacer()

                        // Bottom Buttons
                        HStack {
                            NavigationLink(destination: IhramView()) {
                                Text("Back")
                                    .frame(width: 100, height: 4)
                                    .padding()
                                    .background(Color(hex: "#79634B"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                    .font(.custom("Amiri-Bold", size: 18))
                            }
                            Spacer()
                            NavigationLink(destination: SaiView()) {
                                Text("Continue")
                                    .frame(width: 100, height: 4)
                                    .padding()
                                    .background(isCompleted ? Color(hex: "#79634B") : Color.gray.opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                    .font(.custom("Amiri-Bold", size: 18))
                            }
                            .disabled(!isCompleted)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, -88)
                    }
                    .navigationBarBackButtonHidden(true)

                }

                // Modal with blurred background
                if showHelpModal {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Text("Welcome to the Umrah Guide App!")
                            .font(.custom("Amiri-Bold", size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 8)

                        Text("""
                        We strive to provide you with a unique and seamless experience to help you perform Umrah with ease. Please read the following instructions to make the most out of the app:

                        How to Use App:

                        1. Ihram:
                           • Read the intentions and recommended supplications.
                        2. Tawaf:
                           • Use the counter to track each round.
                           • Supplications will appear for each round.
                        3. Sa’i:
                           • Track your 7 rounds between Safa and Marwah using the counter.
                        4. Hair Trimming/Shaving:
                           • Follow the rules based on your gender.

                        Notes:
                        • Use the counter after each round to avoid errors.
                        • The progress bar shows your current and remaining steps.
                        • You can return to this instructions page by clicking the question mark icon.
                        """)
                        .font(.custom("Amiri-Regular", size: 12))
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .lineSpacing(4)

                        Button(action: {
                            showHelpModal = false
                        }) {
                            Text("Close")
                                .font(.custom("Amiri-Bold", size: 16))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 40)
                                .background(Color.brown)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .padding(30)
                }
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct TawafView_Previews: PreviewProvider {
    static var previews: some View {
        TawafView()
    }
}
