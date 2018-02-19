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
    
    @IBAction func fadeInTapped(_ sender: UIButton) {
        
        imageView.alpha = 0 //image invisible
        
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 1
        }
    }
    
    
    @IBAction func slideInTapped(_ sender: UIButton) {
        
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        
        UIView.animate(withDuration: 2) {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        }
        
    }
    
    @IBAction func growTapped(_ sender: UIButton) {
       //frame allows you to set both coordinates and size of image
        //will be at top left corner of screen because it's aspect fit so the frame of the image at top left but since image isn't a square and thus is only viewable slight down from the top corner of screen
        imageView.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: self.view.center.x - 200, y: self.view.center.y - 200, width: 400, height: 400)
        }
        
    }
    
    
    @objc func animate() {
        
        imageView.image = UIImage(named:"frame_\(counter)_delay-0.07s.gif")
        counter += 1
        
        if counter == 40 {
            
            counter = 0
            
        }
    }
    
    
    @IBAction func startAnimationTapped(_ sender: UIButton) {
                
        if !isAnimating {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(ViewController.animate), userInfo: nil, repeats: true)
            animationButton.setTitle("Stop Animation", for: .normal)
            isAnimating = true
            
        } else {
            
            timer.invalidate()
            animationButton.setTitle("Start Animation", for: .normal)
            isAnimating = false
            
        }
        
    }
    
    
}
