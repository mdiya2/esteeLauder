import SwiftUI

enum Player: String {
    case x = "X"
    case o = "O"
}

struct puzzle: View {
    @State private var currentPlayer = Player.x
    @State private var moves: [Player?] = Array(repeating: nil, count: 9)
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("Tic-Tac-Toe")
                .font(.title)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
                ForEach(0..<9) { index in
                    Button(action: {
                        makeMove(at: index)
                    }) {
                        Text(moves[index]?.rawValue ?? "")
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.2))
                    }
                }
            }
            .padding()
            
            Text(message)
                .padding()
            
            Button(action: restartGame) {
                Text("Restart")
            }
            .padding()
        }
    }
    
    func makeMove(at index: Int) {
        guard moves[index] == nil else { return }
        
        moves[index] = currentPlayer
        
        if checkWinCondition() {
            message = "Player \(currentPlayer.rawValue) wins!"
        } else if moves.filter({ $0 == nil }).isEmpty {
            message = "It's a tie!"
        } else {
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }
    
    func checkWinCondition() -> Bool {
        let winningCombinations: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // horizontal rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // vertical columns
            [0, 4, 8], [2, 4, 6]             // diagonal lines
        ]
        
        for combination in winningCombinations {
            let positions = combination.map { moves[$0] }
            if positions.filter({ $0 == currentPlayer }).count == 3 {
                return true
            }
        }
        
        return false
    }
    
    func restartGame() {
        currentPlayer = .x
        moves = Array(repeating: nil, count: 9)
        message = ""
    }
}

struct puzzle_Previews: PreviewProvider {
    static var previews: some View {
        puzzle()
    }
}
