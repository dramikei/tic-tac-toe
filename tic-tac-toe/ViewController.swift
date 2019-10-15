//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Raghav Vashisht on 26/08/19.
//  Copyright © 2019 Raghav Vashisht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    
    // 0 = Cross,
    // 1 = Oval,
    // -1 = Empty
    var activePlayer = 0 // 0 == Player 1, 1 == Player 2
    var hasWon = false
    var gameState = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
    var winningPositions = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        if !hasWon {
            if activePlayer == 0 && gameState[sender.tag] == -1 {
                sender.setImage(UIImage(named: "Oval"), for: .normal)
                gameState[sender.tag] = activePlayer
                activePlayer = 1
                checkWon()
            } else if activePlayer == 1 && gameState[sender.tag] == -1 {
                sender.setImage(UIImage(named: "Cross"), for: .normal)
                gameState[sender.tag] = activePlayer
                activePlayer = 0
                checkWon()
            }
        }
    }
    
    func checkWon() {
        for x in 0..<8 {
            if (gameState[winningPositions[x][0]] == 1 && gameState[winningPositions[x][1]] == 1 && gameState[winningPositions[x][2]] == 1) {
                //Oval has won
                print("Oval has won")
                gameLabel.text = "Player 2 has won!"
                hasWon = true
            } else if (gameState[winningPositions[x][0]] == 0 && gameState[winningPositions[x][1]] == 0 && gameState[winningPositions[x][2]] == 0) {
                //Cross has won
                print("Cross has won")
                gameLabel.text = "Player 1 has won!"
                hasWon = true
            }
            
        }
    }
    
}

