//
//  Protocol.swift
//  EventScheduler
//
//  Created by priscila costa on 2017-10-10.
//  Copyright © 2017 Algonquin College. All rights reserved.
//

import Foundation

protocol EventPassingDelegate {
    func passEventBack(newEvent : Event)
}
