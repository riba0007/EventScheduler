//
//  NewEventViewController.swift
//  EventScheduler
//
//  Created by priscila costa on 2017-10-10.
//  Copyright © 2017 Algonquin College. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var dpDate: UIDatePicker!
    
    var delegate : EventPassingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Description border
        tvDescription.layer.borderWidth = 0.5
        tvDescription.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        tvDescription.layer.cornerRadius = 5.0
        
        //Keyboard - return key
        tfTitle.delegate = self
        tfTitle.returnKeyType = UIReturnKeyType.next
        
       // tvDescription.delegate = self
       // tvDescription.returnKeyType = UIReturnKeyType.done
        
    }

    //hide the keyboard for any field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //hide the keyboard by pressing return (Title)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfTitle.resignFirstResponder()
        tvDescription.becomeFirstResponder()
        return false
    }
    
    //hide the keyboard by pressing return (Description)
    /*func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"  // Recognizes enter key in keyboard
        {
            tvDescription.resignFirstResponder()
            return false
        }
        return true
    }*/
    
    //saves the new event
    @IBAction func createEventButtonAction(_ sender: Any) {
        
        //Title is required.
        guard let title = tfTitle.text, !title.isEmpty else {
            return
        }
        
        //Add dismissing the textView's, and textField's keyboard in the button's action (2pt)
        tfTitle.resignFirstResponder()
        tvDescription.becomeFirstResponder()

        //pass event back to tableView
        delegate?.passEventBack(
            newEvent: Event(title: title, description: tvDescription.text!, dateObject: dpDate.date)
        )
        
        //dismiss view
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
