//
//  TVController.swift
//  csmit207-hw
//
//  Created by Colette Smith on 2/24/21.
//

import UIKit

class TVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        volumeLabel.text = "0"
        channelLabel.text = "1"
        
        let tabbar = tabBarController as! BaseTabBarController
        segmentedControl.setTitle(tabbar.favoriteNames[0], forSegmentAt: 0)
        segmentedControl.setTitle(tabbar.favoriteNames[1], forSegmentAt: 1)
        segmentedControl.setTitle(tabbar.favoriteNames[2], forSegmentAt: 2)
        segmentedControl.setTitle(tabbar.favoriteNames[3], forSegmentAt: 3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! BaseTabBarController
        segmentedControl.setTitle(tabbar.favoriteNames[0], forSegmentAt: 0)
        segmentedControl.setTitle(tabbar.favoriteNames[1], forSegmentAt: 1)
        segmentedControl.setTitle(tabbar.favoriteNames[2], forSegmentAt: 2)
        segmentedControl.setTitle(tabbar.favoriteNames[3], forSegmentAt: 3)
    }
    
    var channel = "00"

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var allButtons: [UIButton]!
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
    
    @IBAction func favoriteChannels(_ sender: UISegmentedControl) {
        let tabbar = tabBarController as! BaseTabBarController
        channelLabel.text = tabbar.favoriteNumbers[sender.selectedSegmentIndex]
    }
    
    @IBAction func controlDisabled(_ sender: UISwitch) {
        let enabled = (sender.isOn == true)
        slider.isEnabled = enabled
        for button in allButtons {
            button.isEnabled = enabled
        }
        segmentedControl.isEnabled = enabled
    }
    
    
}
