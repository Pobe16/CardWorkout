//
//  ViewController.swift
//  CardWorkout
//
//  Created by Mikolaj Lukasik on 23/04/2020.
//  Copyright © 2020 Mikolaj Lukasik. All rights reserved.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    
    var cards: [UIImage] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons.forEach {
            $0.layer.cornerRadius = 8
        }
        populateCards()
        
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }

    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
    
    func populateCards() {
        let cardsRange = (2...10).map{String($0)}
        let cardsFigures = ["J", "Q", "K", "A"]
        let cardValues = cardsRange + cardsFigures
        let cardColours = ["C", "D", "H", "S"]
        
        for i in cardValues {
           for j in cardColours {
            cards.append(UIImage(named: i+j) ?? UIImage())
           }
        }
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.125, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
}

