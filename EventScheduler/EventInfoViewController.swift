//
//  EventInfoViewController.swift
//  EventScheduler
//
//  Created by priscila costa on 2017-10-10.
//  Copyright © 2017 Algonquin College. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {

    var event : Event?
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var EventDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set textfields with event info
        if let e = event {
            eventName.text = e.title
            eventDate.text = e.getDateString()
            EventDescription.text = e.description
        }
    }
}
