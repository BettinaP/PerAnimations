//
//  ViewController.swift
//  PerAnimations
//
//  Created by Bettina on 2/18/18.
//  Copyright © 2018 Bettina Prophete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animationButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    var counter = 0
    var timer = Timer()
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:"frame_0_delay-0.07s.gif")
        
    }
    
    @objc func animate() {
            if counter < 9 {
                imageView.image = UIImage(named:"frame_0\(counter)_delay-0.07s.gif")
                counter += 01
                print("frame_0\(counter)_delay-0.07s.gif")
            } else {
                imageView.image = UIImage(named:"frame_\(counter)_delay-0.07s.gif")
                counter += 01
                print("else frame: frame_\(counter)_delay-0.07s.gif")
                
            }

        
        if counter == 40 {
            counter = 0
            print("counter value is \(counter) and has been reset to 0 ")
        }
    }
    
    @IBAction func startAnimationTapped(_ sender: UIButton) {
        
        
        if isAnimating {
            timer.invalidate()
            animationButton.setTitle("Start Animation", for: .normal)
            isAnimating = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(ViewController.animate), userInfo: nil, repeats: true)
            animationButton.setTitle("Stop Animation", for: .normal)
            isAnimating = true
        }
        
        //        imageView.image = UIImage(named:"frame_\(counter)_delay-0.07s.gif")
        //        counter += 01
        //        if counter == 40 {
        //            counter = 0
        //        }
        //        print("counter: \(counter)")
        //
    }
    
}

