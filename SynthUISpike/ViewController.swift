//
//  ViewController.swift
//  Universal Knob
//
//  Created by Matthew Fecher on 10/16/17.
//  Copyright © 2017 Matthew Fecher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var knobOne: ImageKnob!
    @IBOutlet weak var knobTwo: ImageKnob!
    @IBOutlet weak var knobThree: ImageKnob!
    @IBOutlet weak var knobFour: ImageKnob!
    @IBOutlet weak var knobFive: ImageKnob!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        
        // set knob initial positions
        knobOne.value = 0.5
        knobTwo.value = 0.0
        knobThree.value = 0.3
        knobFour.value = 0.75
        knobFive.value = 0.5
    }
    
    //*****************************************************************
    // MARK: - Setup Knob 🎛 Callbacks
    //*****************************************************************
    
    func setupCallbacks() {
       
        knobOne.callback = { value in
              self.displayLabel.text = "Knob One: \(String(format: "%.02f", value))"
        }
        
        knobTwo.callback = { value in
            self.displayLabel.text = "Knob Two: \(String(format: "%.02f", value))"
        }
      
        knobThree.callback = { value in
            self.displayLabel.text = "Knob Three: \(String(format: "%.02f", value))"
        }
        
        knobFour.callback = { value in
            self.displayLabel.text = "Knob Four: \(String(format: "%.02f", value))"
        }
        
        knobFive.callback = { value in
            self.displayLabel.text = "Knob Five: \(String(format: "%.02f", value))"
        }
       
    }

}

