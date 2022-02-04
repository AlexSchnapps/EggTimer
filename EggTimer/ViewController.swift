//
//  ViewController.swift
//  EggTimer

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 5,
        "Hard": 7
    ]
    
    var timer = Timer()
    
    var secondsRemaining = 60
    
    //MARK: - IBActions
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        guard let hardness = sender.titleLabel?.text else { return }
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 1
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }
    
    
}
