//
//  ViewController.swift
//  guessingGame
//
//  Created by Patrick Liu on 9/29/18.
//  Copyright © 2018 Patrick Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonClick(_ sender: Any) {
        if justWon {
            generateRandom()
            button.setTitle("Go",for: .normal)
            justWon = false;
            label.text = "guess number again";
        } else {
            evaluateInput()
        }
    }
    var attempts = 0;
    var answer = 0;
    var justWon = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandom()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func generateRandom () {
        answer = Int.random(in:0...10);
    }
    func evaluateInput () {
        guard let text = textField.text else {return};
        guard let guess = Int(text) else {return};
        attempts += 1;
        if guess < answer {
            label.text = "Too low!";
        } else if guess > answer {
            label.text = "Too high!";
        } else {
            label.text = "You won in \(attempts) attempts!";
            justWon = true;
            button.setTitle("Play Again", for: .normal)
        }
        textField.text = "";
    }
}

