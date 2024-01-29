//
//  Destination.swift
//  iTour-SwiftData
//
//  Created by ömer şanlı on 28.01.2024.
//

import Foundation
import SwiftData


//  Why we add @Model annotation?
//  Because this is a macro annotation that we want to able to load and save inside permanent storage from SwiftData.

@Model
class Destination{
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [Sight]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
