//
//  NCardMontyViewController.swift
//  TabbedMonty
//
//  Created by The TEAM on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//


import UIKit

class NCardMontyViewController: UIViewController {
    
    var gameLabel: UILabel!
    let howManyCards: Int
    
    let brain: MontyBrain
    
    let resetTitle = "Reset"
    
    required init?(coder aDecoder: NSCoder) {
        self.howManyCards = 21
        self.brain = MontyBrain(numCards: self.howManyCards)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGameButtons()
    }
    
    func resetButtonColors() {
        for v in view.subviews {
            if let button = v as? UIButton {
                if button.currentTitle != resetTitle {
                    button.backgroundColor = UIColor.blue
                    button.isEnabled = true
                    
                }
            }
        }
    }
    
    func handleReset() {
        resetButtonColors()
        brain.setupCards()
    }
    
    func disableCardButtons() {
        for v in view.subviews {
            if let button = v as? UIButton {
                if button.currentTitle != resetTitle {
                    button.isEnabled = false
                }
            }
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        gameLabel.text = sender.currentTitle
        
        if brain.checkCard(sender.tag - 1) {
            gameLabel.text = "Winner winner chicken dinner!"
            sender.backgroundColor = UIColor.green
            disableCardButtons()
            
            
        } else {
            gameLabel.text = "Nope! Guess again."
            sender.backgroundColor = UIColor.red
        }
    }
    
    func setUpResetButton() {
        let resetRect = CGRect(x: 10, y: 300, width: 60, height: 40)
        let resetButton = UIButton(frame: resetRect)
        resetButton.setTitle(resetTitle, for: UIControlState())
        resetButton.backgroundColor = UIColor.darkGray
        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    
    func setUpGameLabel () {
        gameLabel = UILabel()
        gameLabel.text = "Let's Play!"
        view.addSubview((gameLabel))
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        gameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUpGameButtons() {
        for i in 1...howManyCards {
            let y = ((i - 1) / 3) + 1
            let x = ((i - 1) % 3) + 1
            
            let rect = CGRect(origin: CGPoint(x: (Double(50 * x) + 50), y: (Double(y * 50) + 50) + 50), size: CGSize(width: 40, height: 40))
            let button = UIButton(frame: rect)
            button.tag = i
            button.backgroundColor = UIColor.blue
            button.setTitle(String(i), for: UIControlState())
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            self.view.addSubview(button)
        }
        setUpResetButton()
        setUpGameLabel()
    }
}

