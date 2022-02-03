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
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
      ]
      
      @IBAction func hardnessSelection(_ sender: UIButton) {
          guard let hardness = sender.titleLabel?.text else { return }
          print(hardness)
          
          switch hardness {
              
          case "Soft":
              print(eggTimes["Soft"]!)
          case "Medium":
              print(eggTimes["Medium"]!)
          case "Hard":
              print(eggTimes["Hard"]!)
          default:
              print("nil")
          }
          
      }
      
  }

Блиииин(
