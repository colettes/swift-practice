//
//  ViewController.swift
//  csmit207-remote
//
//  Created by Colette Smith on 2/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    var channel = "00"

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    @IBOutlet weak var volume: UISlider!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerLabel.text = sender.isOn ? "On" : "Off"
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        volumeLabel.text = String(Int(sender.value))
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            
            if channel.count == 2 {
                channel = String(title)
            }
            else if channel.count == 1 {
                if channel == "0" {
                    channel += String(title)
                    channelLabel.text = String(title)
                }
                else {
                    channel += String(title)
                    channelLabel.text = channel
                }
            }
        }
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        if channelLabel.text != "99" {
            channelLabel.text = String(Int(channelLabel.text!)! + 1)
        }
        else {
            channelLabel.text = "0"
            }
        }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        if channelLabel.text != "0" {
            channelLabel.text = String(Int(channelLabel.text!)! - 1)
        }
        else {
            channelLabel.text = "99"
            }
    }
    
    @IBAction func favoriteChannel(_ sender: UISegmentedControl) {
        if let name = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            if name == "FOX" {
                channelLabel.text = "2"
            }
            else if name == "NBC" {
                channelLabel.text = "4"
            }
            else if name == "CBS" {
                channelLabel.text = "62"
            }
            else if name == "ABC" {
                channelLabel.text = "7"
            }
        }
    }
    
    @IBAction func controlDisabled(_ sender: UISwitch) {
        let enabled = (sender.isOn == true)
        volume.isEnabled = enabled
        for button in buttons {
            button.isEnabled = enabled
        }
        segmentedControl.isEnabled = enabled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeLabel.text = "0"
        channelLabel.text = "1"
    }


}

