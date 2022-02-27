//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 500, "Hard": 7];
    
    var totalTime = 0;
    
    var secondsPassed = 0;
    
    var timer = Timer();
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate();
        let hardness = sender.currentTitle!;
        totalTime = eggTimes[hardness]!;
        
        progressBar.progress = 0;
        secondsPassed = 0;
        titleLabel.text = hardness;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        
        if secondsPassed < totalTime {
            secondsPassed += 1;
            let percentage = Float(secondsPassed) / Float(totalTime);
            progressBar.progress = percentage;
        } else {
            timer.invalidate();
            titleLabel.text = "DONE!";
        }
    }
    

}
