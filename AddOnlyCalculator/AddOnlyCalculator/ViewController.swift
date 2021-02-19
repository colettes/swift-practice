//
//  ViewController.swift
//  csmit207 hw3
//
//  Created by Colette Smith on 1/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = String()
    var secondNumber = String()
    var result = Int()

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let title = sender.currentTitle {
            resultLabel.text! += "\(title)"
        }
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        firstNumber = resultLabel.text ?? "0"
        resultLabel.text = ""
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        if let secondNumber = resultLabel.text {
            result = Int(firstNumber)! + Int(secondNumber)! 
            resultLabel.text = String(result)
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        resultLabel.text = ""
        firstNumber = ""
        secondNumber = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

