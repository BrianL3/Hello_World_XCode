//
//  ViewController.swift
//  Bullseye
//
//  Created by Brian Ledbetter on 10/13/14.
//  Copyright (c) 2014 Brian Ledbetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var currentRound = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var targetValue = 0
    var difference = 0
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert() {
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = difference * -1 }
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value was: \(targetValue)"
        let alert = UIAlertController(title: "A hit!",
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        totalScore = (100-difference) + totalScore
        startNewRound()
    }
    @IBAction func roundReset(){
        startOver()
    }
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        currentRound = 1 + Int(currentRound)
        updateLabels()
       
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        // println(currentRound)
        // roundLabel.text = "\(currentRound)"
        roundLabel.text = String(currentRound)
        scoreLabel.text = String(totalScore)
    }
    func startOver(){
            currentRound = 0
            totalScore = 0
            startNewRound()
    }
}