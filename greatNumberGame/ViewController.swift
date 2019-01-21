//
//  ViewController.swift
//  greatNumberGame
//
//  Created by Gurpal Bhoot on 10/29/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IB-Outlets
    @IBOutlet weak var guessTextField: UITextField!


    // Variables
    var randomNum = Int()
    var guess = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
    }

    // Functions
    func setupView() {
        randomNum = Int.random(in: 1...100)
    }
    
    func guessLow() {
        let alert = UIAlertController(title: "Incorrect", message: "\(guess) is too low", preferredStyle: .alert)

        alert.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func guessHigh() {
        let alert = UIAlertController(title: "Incorrect", message: "\(guess) is too high", preferredStyle: .alert)

        alert.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func guessEqual() {
        let alert = UIAlertController(title: "Correct", message: "\(guess) was correct", preferredStyle: .alert)
        
        alert.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        alert.addAction(UIAlertAction(title: "Play Again", style: .destructive, handler: { ACTION in self.restartGame()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func restartGame() {
        print("Game restarted")
        randomNum = Int.random(in: 1...100)
    }
    
    // IB-Actions
    @IBAction func submitButtonPressed(_ sender: Any) {
        print("Submit button pressed")
        let guessing : Int? = Int(guessTextField.text!)
        guess = guessing!
        if guess < randomNum {
            guessLow()
        } else if guess > randomNum {
            guessHigh()
        } else {
            guessEqual()
        }
    }
}

