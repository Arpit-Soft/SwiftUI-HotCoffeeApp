//
//  NSManagedObjectContext+Extensions.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 24/07/21.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            return appdelegate.persistentContainer.viewContext
        }
        return NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    }
}
