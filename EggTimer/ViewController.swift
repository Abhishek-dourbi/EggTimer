//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12];
    
    var counter = 0;
    
    var timer = Timer();
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate();
        
        let hardness = sender.currentTitle!;
        
        let result = eggTimes[hardness]!
        
        counter = result * 60;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        }
    }
    

}
