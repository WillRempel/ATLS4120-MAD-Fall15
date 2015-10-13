//
//  ViewController.swift
//  Lab 4
//
//  Created by Will Rempel on 10/12/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    var translation = CGPointMake(0.0, 0.0)
    var angle: CGFloat=0.0
    var delta = CGPointMake(12, 4)
    var ballRadius = CGFloat()
    var timer = NSTimer()
    
    func moveImage(){
        let duration=Double(slider.value)
        UIView.beginAnimations("tennis_ball", context: nil)
        UIView.animateWithDuration(duration, animations:
            {self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
                self.imageView.center=CGPointMake(self.imageView.center.x + self.delta.x, self.imageView.center.y + self.delta.y)
        
        
           self.angle += 0.02
            if self.angle > CGFloat(2*M_PI){
       self.angle=0
            }
        })
        
            
        UIView.commitAnimations()
        
        if imageView.center.x > view.bounds.size.width-ballRadius || imageView.center.x < ballRadius{
            delta.x = -delta.x
        }
        
        if imageView.center.y > view.bounds.size.height - ballRadius || imageView.center.y < ballRadius{
            delta.y = -delta.y
        }
    }
    
    func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        ballRadius=imageView.frame.size.width/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
