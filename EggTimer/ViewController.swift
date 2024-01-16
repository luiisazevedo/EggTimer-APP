//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft":3, "Medium":420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        secondPassed = 0
        let hardness = sender.currentTitle!
        // the ! is use to says that "yes this button have a title"
        progressBar.progress = 0.0
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        
        //set the counter to the user choice
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
           
        
        
    }


    @objc func updateCounter() {
        if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress =  Float (secondPassed) / Float(totalTime)
                                    
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
