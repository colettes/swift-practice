//
//  DVRController.swift
//  csmit207-DVR
//
//  Created by Colette Smith on 2/15/21.
//

import UIKit

class DVRController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet var allButtons: [UIButton]!
    
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerLabel.text = sender.isOn ? "ON" : "OFF"
    }
    
    @IBAction func isDisabled(_ sender: UISwitch) {
        let enabled = (sender.isOn == true)
        for button in allButtons {
            button.isEnabled = enabled
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            switch title {
            case "PLAY":
                if stateLabel.text != "RECORDING" {
                    stateLabel.text = "PLAYING"
                } else {
                    displayAlert("PLAYING", "Cannot PLAY while RECORDING. Would you like to force PLAY?")
                }
                
            case "STOP":
                stateLabel.text = "STOPPED"
                
            case "PAUSE":
                if stateLabel.text == "PLAYING" {
                    stateLabel.text = "PAUSING"
                } else {
                    displayAlert("PAUSING", "Cannot PAUSE while not PLAYING. Would you like to force PAUSE?")
                }
                
            case "FAST FORWARD":
                if stateLabel.text == "PLAYING" {
                    stateLabel.text = "FAST FORWARDING"
                } else {
                    displayAlert("FAST FORWARDING", "Cannot FAST FORWARD while not PLAYING. Would you like to force PAUSE?")
                }
                
            case "REWIND":
                if stateLabel.text == "PLAYING" {
                    stateLabel.text = "REWINDING"
                } else {
                    displayAlert("REWINDING", "Cannot REWIND while not PLAYING. Would you like to force REWIND?")
                }
                
            case "RECORD":
                if stateLabel.text == "STOPPED" {
                    stateLabel.text = "RECORDING"
                } else {
                    displayAlert("RECORDING", "Cannot RECORD while not STOPPED. Would you like to force RECORD?")
                }
            default:
                stateLabel.text = stateLabel.text
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func displayAlert(_ buttonText: String, _ message: String) {
        // Declare Alert message
        
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .actionSheet);
        
        let requestSuccess = UIAlertController(title: "Confirmed", message: "DVR was stopped and forced to requested state.", preferredStyle: .actionSheet);
                        
        let force = UIAlertAction(title:"Force", style: .destructive, handler:{(alert: UIAlertAction!) in self.stateLabel.text = buttonText;
            requestSuccess.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil));
            self.present(requestSuccess, animated: true, completion: nil);
        });

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        
        //Add OK and Cancel button to dialog message
        alert.addAction(force)
        alert.addAction(cancel)
        
        // Present dialog message to user
        self.present(alert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
