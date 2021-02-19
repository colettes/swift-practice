//
//  ViewController.swift
//  csmit207 Shopping List
//
//  Created by Colette Smith on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var listTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        quantityTextField.resignFirstResponder()
    }
    

    @IBAction func newListPressed(_ sender: UIButton) {
        listTextView.text = ""
    }
    
    @IBAction func newItemPressed(_ sender: UIButton) {
        descriptionTextField.text = ""
        quantityTextField.text = ""
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if let quantity = Int(quantityTextField.text!),
           let item = descriptionTextField.text, !item.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
        {
            listTextView.text += "\(quantity)x \(item) \n"
            quantityTextField.text = ""
            descriptionTextField.text = ""
        } else {
            displayAlert()
        }
    }
    
    func displayAlert() {
        let title = "Error:"
        let message = "Invalid input entered."
        let alertController = UIAlertController(title: title,
        message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
        style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true,
        completion: nil)
    }
}

