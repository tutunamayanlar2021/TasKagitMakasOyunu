//
//  main.swift
//  TasKagitOyunu
//
//  Created by Kader Oral on 18.06.2023.
//

import Foundation


enum GameState {
    case win, lose, tie
}

enum HandSign: Int{
    case rock = 1
    case paper
    case scissors
    
    
    var description: String{
        switch self {
        case .rock:
            return "Taş"
        case .paper:
            return "Kağıt"
        case .scissors:
            return "Makas"
            
        }
        
    }
    
}

func getUserChoice() -> HandSign? {
    print("Seçiniz Taş-1, Kağıt-2, Makas-3 :")
    if let userInput = readLine(),
       let userChoice = Int(userInput),
       let handSign = HandSign(rawValue: userChoice) {
        return handSign
    }
    else {
        print("Geçersiz bir seçim yaptınız. Tekrar deneyin.")
        return nil
    }
}

func getComputerChoice() -> HandSign {
    let randomChoice = Int.random(in: 1...3)
    return HandSign(rawValue: randomChoice)!
}

func determineGameState(userChoice: HandSign, computerChoice: HandSign) -> GameState {
    if userChoice == computerChoice {
        return .tie
    } else if (userChoice == .rock && computerChoice == .scissors) ||
                (userChoice == .paper && computerChoice == .rock) ||
                (userChoice == .scissors && computerChoice == .paper) {
        return .win
    } else{
        return .lose
    }
}

func playGame() {
    print("***********************TAŞ-KAĞIT-MAKAS OYUNUNA HOŞ GELDİNİZ!***********************\n")
    
    while true {
        
        if let userChoice = getUserChoice(){
            let computerChoice = getComputerChoice()
            
            print("Siz: \(userChoice.description)")
            print("Bilgisayar: \(computerChoice.description)")
            
            let gameState = determineGameState(userChoice: userChoice, computerChoice: computerChoice)
            
            switch gameState {
            case .win:
                print("Tebrikler, kazandınız!")
            case .lose:
                print("Maalesef, kaybettiniz.")
            case .tie:
                print("Berabere!")
            }
            
            print("--------------------------------\n")
            print("Yeniden oynamak için 'y' tuşuna basın, çıkmak için herhangi bir tuşa basın.")
            if let playAgain = readLine(), playAgain.lowercased() != "y" {
                break
            }
        }
        
        
    }
}

playGame()
