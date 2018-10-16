//
//  Event.swift
//  Assignment_1
//
//  Created by priscila costa on 2017-09-21.
//  Copyright © 2017 Algonquin College. All rights reserved.
//

import Foundation

class Event {
    //optional variables
    var title : String?
    var description : String?
    var date : Date?
    
    //default contructor
    init(title : String, description : String) {
        self.title = title
        self.description = description
        setDate(formatedDateString: "1900/01/01 00:01")
    }
    
    //overload contructor
    convenience init(title : String, description : String, dateString : String) {
        self.init(title : title, description : description)
        setDate(formatedDateString: dateString)
    }
    
    //overload contructor
    convenience init(title : String, description : String, dateObject : Date) {
        self.init(title : title, description : description)
        self.date = dateObject
    }
    
    //returns a String formatted with the event's title, the event's date.description, and the event's description text
    func getInfo() -> String {
        let dateString = DateFormatter.localizedString(from: self.date!, dateStyle: .short, timeStyle: .short)
        
        //if variable is not set returns a default value
        return "\(self.title!):\n\tDate: \(dateString) \n\t\(self.description!)\n\n"
    }
    
    //return a String formated with the event date
    func getDateString() -> String {
        return DateFormatter.localizedString(from: self.date!, dateStyle: .short, timeStyle: .short)
    }
    
    //receives a text formated as "yyyy/MM/dd HH:mm" and sets to the variable date
    func setDate(formatedDateString: String){
        let formatting = DateFormatter()
        formatting.dateFormat = "yyyy/MM/dd HH:mm"
        self.date = formatting.date(from: formatedDateString)
    }
}
