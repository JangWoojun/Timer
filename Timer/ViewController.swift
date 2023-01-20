//
//  ViewController.swift
//  Timer
//
//  Created by Jangwoojun on 2023/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        timeLabel.text = "0s"
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let second = Int(slider.value * 100)
        timeLabel.text = "\(second)s"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {

        
    }
    
    
}

