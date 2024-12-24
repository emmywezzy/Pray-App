import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var response: String = ""
    @State private var prayerGuide: String = ""
    @State private var isTyping: Bool = false // To simulate typing animation

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color(white: 0.95), Color(white: 0.9)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Cross and Pray logo at the top
                HStack {
                    Image(systemName: "cross.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.blue)
                    
                    Text("Pray")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.top, 50)

                Spacer()

                // Text input field and submit button
                HStack {
                    TextField("Type how you feel...", text: $userInput)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)

                    Button(action: {
                        submitFeeling()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 24))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                }
                .padding()

                // Prayer guide and reflection output
                if !response.isEmpty || !prayerGuide.isEmpty {
                    VStack(spacing: 20) {
                        if !prayerGuide.isEmpty {
                            Text("Prayer Guide:")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.blue)
                                .padding(.bottom, 5)
                            
                            Text(prayerGuide)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                        }

                        if !response.isEmpty {
                            Text("Your Reflection:")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                            
                            Text(response)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                                .animation(.easeInOut, value: response)
                        }
                    }
                }

                Spacer()
            }

            // Centered typing animation
            if isTyping {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Typing...")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center) // Centered typing animation
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }

    // Simulate typing animation and respond with a static reflection
    func submitFeeling() {
        isTyping = true
        response = "" // Clear previous response
        prayerGuide = "" // Clear previous guide

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isTyping = false
            withAnimation {
                // Generate static reflection based on user input
                response = getResponse(for: userInput)
                prayerGuide = getPrayerGuide(for: userInput) // Add prayer guide based on input
            }
            userInput = "" // Clear input field
        }
    }

    // Generate static response based on user input
    func getResponse(for feeling: String) -> String {
        switch feeling.lowercased() {
        case "gratitude":
            return "Take a moment to reflect on what you're grateful for. \n\n\"Give thanks in all circumstances; for this is the will of God in Christ Jesus for you.\" – 1 Thessalonians 5:18"
        case "anxiety":
            return "Calm your heart and mind. \n\n\"Cast all your anxiety on Him because He cares for you.\" – 1 Peter 5:7"
        case "happy":
            return "Embrace the joy and express it. \n\n\"Rejoice in the Lord always; again I will say, rejoice.\" – Philippians 4:4"
        case "sinful":
            return "Reflect on your actions and seek forgiveness. \n\n\"If we confess our sins, He is faithful and just to forgive us.\" – 1 John 1:9"
        case "lust":
            return "Seek strength and clarity. \n\n\"Flee from sexual immorality... glorify God with your body.\" – 1 Corinthians 6:18-20"
        case "loneliness":
            return "You are never alone. \n\n\"The Lord is near to the brokenhearted and saves the crushed in spirit.\" – Psalm 34:18"
        case "anger":
            return "Release your anger and find peace. \n\n\"Be quick to hear, slow to speak, slow to anger; for the anger of man does not produce the righteousness of God.\" – James 1:19-20"
        case "fear":
            return "Trust in God's protection. \n\n\"Fear not, for I am with you; be not dismayed, for I am your God.\" – Isaiah 41:10"
        default:
            return "Be thankful for today and trust in God's plan."
        }
    }

    // Generate a prayer guide based on the user’s input
    func getPrayerGuide(for feeling: String) -> String {
        switch feeling.lowercased() {
        case "gratitude":
            return """
            How to Pray:
            1. Thank God for His blessings in your life.
            2. Reflect on the specific things you are grateful for today.
            3. End your prayer by expressing your gratitude for God's grace and mercy.
            """
        case "anxiety":
            return """
            How to Pray:
            1. Begin by asking God to calm your heart and mind.
            2. Pray for trust in God's protection and care.
            3. Reflect on Bible verses that encourage peace in times of anxiety.
            """
        case "happy":
            return """
            How to Pray:
            1. Thank God for the joy you are experiencing.
            2. Ask for continued blessings and express your gratitude for moments of happiness.
            3. Share your joy in prayer and praise God for the good in your life.
            """
        case "sinful":
            return """
            How to Pray:
            1. Confess your sins before God with honesty.
            2. Ask for forgiveness and reflect on God's promise to cleanse your heart.
            3. Pray for strength to avoid temptation and live in righteousness.
            """
        case "lust":
            return """
            How to Pray:
            1. Acknowledge your feelings and struggles before God.
            2. Pray for clarity, strength, and the desire to honor God with your actions.
            3. Seek God's guidance to remain pure and live a life of holiness.
            """
        case "loneliness":
            return """
            How to Pray:
            1. Ask God to remind you that you are never truly alone.
            2. Pray for a sense of God's presence and comfort.
            3. Reflect on Bible verses that remind you of God's companionship in difficult times.
            """
        case "anger":
            return """
            How to Pray:
            1. Acknowledge your anger and frustrations before God.
            2. Pray for peace and the ability to forgive those who have wronged you.
            3. Ask God to help you release anger and embrace patience and understanding.
            """
        case "fear":
            return """
            How to Pray:
            1. Bring your fears and worries before God.
            2. Ask for strength and courage to face challenges with faith.
            3. Reflect on verses that remind you of God's protection and sovereignty.
            """
        default:
            return "Be thankful, pray for guidance, and trust in God's plan."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
