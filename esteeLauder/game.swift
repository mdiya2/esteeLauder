import SwiftUI

struct Game: View {
    @State private var cards = [
        Card(id: 0, imageName: "game2", isFaceUp: false, isMatched: false),
        Card(id: 1, imageName: "game3", isFaceUp: false, isMatched: false),
        Card(id: 2, imageName: "game1", isFaceUp: false, isMatched: false),
        Card(id: 3, imageName: "game2", isFaceUp: false, isMatched: false),
        Card(id: 4, imageName: "game3", isFaceUp: false, isMatched: false),
        Card(id: 5, imageName: "game4", isFaceUp: false, isMatched: false),
        Card(id: 6, imageName: "game4", isFaceUp: false, isMatched: false),
        Card(id: 7, imageName: "game1", isFaceUp: false, isMatched: false)
    ]

    @State private var message = ""
    @State private var showNotification = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Memory Matching Game")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.998, green: 0.432, blue: 0.548))
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                    ForEach(cards) { card in
                        if !card.isMatched {
                            CardView(card: card) {
                                flipCard(card)
                            }
                        }
                    }
                }
                .padding()
                
                Button(action: restartGame) {
                    Text("Restart")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color(red: 0.998, green: 0.432, blue: 0.548))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                }
            }
            
            if showNotification {
                NotificationView(message: message)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showNotification = false
                            }
                        }
                    }
            }
        }
    }
    
    func flipCard(_ selectedCard: Card) {
        guard !selectedCard.isFaceUp && !selectedCard.isMatched else { return }
        
        var matchedCards = cards.filter { $0.isFaceUp && !$0.isMatched }
        
        if matchedCards.count == 1 {
            let faceUpCard = matchedCards[0]
            
            if faceUpCard.imageName == selectedCard.imageName {
                cards = cards.map { card in
                    if card.id == faceUpCard.id || card.id == selectedCard.id {
                        return Card(id: card.id, imageName: card.imageName, isFaceUp: true, isMatched: true)
                    }
                    return card
                }
                
                message = "You made a match!"
                showNotification = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    cards.removeAll { card in
                        card.isMatched
                    }
                    
                    if cards.isEmpty {
                        message = "Now you'll remember that the Nutritious skincare is the best!"
                        showNotification = true
                    } else {
                        message = ""
                        showNotification = false
                    }
                }
            } else {
                cards = cards.map { card in
                    if card.id == faceUpCard.id || card.id == selectedCard.id {
                        return Card(id: card.id, imageName: card.imageName, isFaceUp: true, isMatched: false)
                    }
                    return card
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cards = cards.map { card in
                        if card.id == faceUpCard.id || card.id == selectedCard.id {
                            return Card(id: card.id, imageName: card.imageName, isFaceUp: false, isMatched: false)
                        }
                        return card
                    }
                }
            }
        } else {
            cards = cards.map { card in
                if card.id == selectedCard.id {
                    return Card(id: card.id, imageName: card.imageName, isFaceUp: true, isMatched: false)
                }
                return card
            }
        }
    }
    
    func restartGame() {
        cards = [
            Card(id: 0, imageName: "game2", isFaceUp: false, isMatched: false),
            Card(id: 1, imageName: "game3", isFaceUp: false, isMatched: false),
            Card(id: 2, imageName: "game1", isFaceUp: false, isMatched: false),
            Card(id: 3, imageName: "game2", isFaceUp: false, isMatched: false),
            Card(id: 4, imageName: "game3", isFaceUp: false, isMatched: false),
            Card(id: 5, imageName: "game4", isFaceUp: false, isMatched: false),
            Card(id: 6, imageName: "game4", isFaceUp: false, isMatched: false),
            Card(id: 7, imageName: "game1", isFaceUp: false, isMatched: false)
        ]
        cards.shuffle()
        message = ""
        showNotification = false
    }
}

struct Card: Identifiable {
    let id: Int
    let imageName: String
    var isFaceUp: Bool
    var isMatched: Bool
}

struct CardView: View {
    let card: Card
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
            } else {
                Color.gray.opacity(0.2)
                    .frame(width: 120, height: 120)
            }
        }
    }
}

struct NotificationView: View {
    let message: String
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.9))
                
                Text(message)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(width: 300, height: 80)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
