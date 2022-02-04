//
//  ViewController.swift
//  EggTimer

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
      let eggTimes = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
      ]
    
    var timer = Timer()
    
    var secondsRemaining = 60
    
      @IBAction func hardnessSelection(_ sender: UIButton) {
          
          timer.invalidate()
          
          guard let hardness = sender.titleLabel?.text else { return }
          
          secondsRemaining = eggTimes[hardness]!
         
          timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                  if self.secondsRemaining > 0 {
                      print ("\(self.secondsRemaining) seconds")
                      self.secondsRemaining -= 1
                  } else {
                      Timer.invalidate()
                  }
              }
      }


}
