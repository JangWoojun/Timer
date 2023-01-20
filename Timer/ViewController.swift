//
//  ViewController.swift
//  Timer
//
//  Created by Jangwoojun on 2023/01/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    weak var timer: Timer?
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        timeLabel.text = "Please select a time"
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
        startButton.isUserInteractionEnabled = false
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let second = Int(slider.value * 100)
        timeLabel.text = "\(second)s"
        num = second
        
        if num == 0 {
            startButton.isUserInteractionEnabled = false
        } else {
            startButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if num > 0 {
                num -= 1
                slider.setValue(Float(num) / 100.0, animated: true)
                timeLabel.text = "\(num)s"
            } else {
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                timeLabel.text = "End"
                startButton.isUserInteractionEnabled = false
            }
        })
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timeLabel.text = "Please select a time"
        slider.setValue(0.5, animated: true)
        timer?.invalidate()
        num = 0
    }
    
    
}

