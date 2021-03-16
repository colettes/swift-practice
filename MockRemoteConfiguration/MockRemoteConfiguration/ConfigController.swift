//
//  ConfigController.swift
//  csmit207-hw
//
//  Created by Colette Smith on 2/24/21.
//

import UIKit

class ConfigController: UIViewController {
    
    var channelName = ""
    var channelNumber = ""
    var segmentIndex = 0

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var channelNumberLabel: UILabel!
    
    @IBAction func labelEntered(_ sender: UITextField) {
    }
        
    @IBAction func editEnded(_ sender: UITextField) {
        let message = "Label must be 1 to 4 characters."
        if let channel = sender.text {
            if channel.count >= 1 && channel.count <= 4 {
                channelName = channel
            } else {
                displayAlert(message)
                sender.text = ""
            }
        }
        sender.resignFirstResponder()
    }
    
    @IBAction func channelStepper(_ sender: UIStepper) {
        self.channelNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        channelNumberLabel.text = "0"
        labelTextField.text = ""
        channelName = ""
        channelNumber = ""
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        channelName = labelTextField.text!
        channelNumber = channelNumberLabel.text!
        segmentIndex = segment.selectedSegmentIndex
        let tabbar = tabBarController as! BaseTabBarController
        tabbar.favoriteNames[segmentIndex] = channelName
        tabbar.favoriteNumbers[segmentIndex] = channelNumber
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "INVALID INPUT", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil));
        self.present(alert, animated: true, completion: nil);
        }
    
    override func viewWillDisappear(_ animated: Bool) {
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = 0
        
        
        // Do any additional setup after loading the view.
    }

}
