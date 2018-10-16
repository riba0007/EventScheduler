//
//  ScheduleTableViewController.swift
//  EventScheduler
//
//  Created by priscila costa on 2017-10-10.
//  Copyright © 2017 Algonquin College. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController, EventPassingDelegate {
    
    //create a new instance of Schedule
    var schedule = Schedule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Test - Create event using addNewEvent
        self.schedule.addNewEvent(title: "My First Task", description: "Awsome, it is working :D", dateString: "2017/10/11 11:12")

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows (events)
        return self.schedule.eventCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        let event = schedule.eventArray[indexPath.row]
        
        //show title
        cell.textLabel?.text = event.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check segue
        if segue.identifier == "ShowEventInfo" {
            let eventInfoVC = segue.destination as? EventInfoViewController
            
            //check cell and indexPath
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            //pass event info to second page
            eventInfoVC?.event = schedule.eventArray[indexPath.row]
            
        } else if segue.identifier == "ShowNewEvent" {
            let newEventVC = segue.destination as? NewEventViewController
            
            newEventVC?.delegate = self
        }
    }
    
    //EventPassingDelegate protocol function
    func passEventBack(newEvent: Event) {
        self.schedule.addNewEvent(eventObject: newEvent)
        self.tableView?.reloadData()
    }
    
    //Delete an event
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //Remove from array of events
            schedule.eventArray.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //In the “New' button action perform the segue with the correct identifier to show the NewEventViewController (2pt)
    @IBAction func createNewButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowNewEvent", sender: self)
    }
}
