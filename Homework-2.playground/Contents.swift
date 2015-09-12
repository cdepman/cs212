//: Playground - noun: a place where people can play

import Foundation

enum CoinToss: Printable {

    case Heads, Tails
    
    init() {
        let randomNumber = arc4random()
        self = randomNumber % 2 == 0 ? .Heads : .Tails
    }
    
    var description: String {
        switch (self) {
            case .Heads:
                return "Heads"
            case .Tails:
                return "Tails"
        }
    }
}

let coin1 = CoinToss()
println(coin1)
coin1.description

enum RPS: Printable {
    case Rock, Paper, Scissors
    
    init() {
        let randomNumber = arc4random() % 3
        self = [.Rock, .Paper, .Scissors][Int(randomNumber)]
    }
    
    var description: String {
        switch (self) {
            case .Rock:
                return "Rock"
            case .Scissors:
                return "Scissors"
            case .Paper:
                return "Paper"
        }
    }
}

enum Outcome: Printable {
    case Win, Loss, Tie
    
    init(){
        self = .Tie
    }
    
    var description: String {
        switch(self){
        case .Win:
            return "Win!"
        case .Loss:
            return "Loss!"
        case .Tie:
            return "Tie!"
        }
    }
}

struct RPSMatch: Printable {
    var playerMove = RPS()
    var opponentMove = RPS()
    var outcome: Outcome {
        switch (playerMove, opponentMove) {
        case _ where playerMove == opponentMove:
                return Outcome.Tie
        case _ where playerMove == RPS.Paper && opponentMove == RPS.Rock:
                return Outcome.Win
        case _ where playerMove == RPS.Rock && opponentMove == RPS.Scissors:
                return Outcome.Win
        case _ where playerMove == RPS.Scissors && opponentMove == RPS.Paper:
                return Outcome.Win
        default:
                return Outcome.Loss
        }
    }
    var description: String {
        return playerMove.description + " vs. " + opponentMove.description + ". " + outcome.description
    }
}

var match1 = RPSMatch()
var match2 = RPSMatch()
var match3 = RPSMatch()
match1.description
match2.description
match3.description

for i in (1...20){
    var match = RPSMatch()
    println( match.description )
}
