//
//  ViewController.swift
//  BullEyesUIKit
//
//  Created by  User on 30.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue  = slider.value.rounded()
        currentValue = Int(slider.value)
        targetValue = Int.random(in: 1...100)
        startOver()
        
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftRecizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftRecizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightRecizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightRecizable, for: .normal)
        
        
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
               
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close"
        }
        
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true)
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
                
        let roundedValue  = slider.value.rounded()
        currentValue = Int(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updatelabels()
    }
    
    func updatelabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
      
    @IBAction func startOver () {
        score = 0
        round = 0
        startNewRound()
    }
}

