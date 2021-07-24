//
//  CoreDataManager.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 24/07/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
}
