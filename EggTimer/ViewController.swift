//
//  ViewController.swift
//  EggTimer

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    //MARK: - Private variables
    private var player: AVAudioPlayer!
    
    //MARK: - IBOutlets
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 5,
        "Hard": 7
    ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    
    //MARK: - IBActions
    @IBAction func hardnessSelection(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        
        guard let hardness = sender.titleLabel?.text else { return }
        
        totalTime = eggTimes[hardness]!
        //MARK: - Timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                self.progressBar.progress =
                Float(self.secondsPassed) /
                Float(self.totalTime)
            } else {
                //MARK: - Player
                func playSound(_ resource: String) {
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    self.player = try! AVAudioPlayer(contentsOf: url!)
                    self.player.play()
                }
                playSound("alarm_sound")
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }
}
