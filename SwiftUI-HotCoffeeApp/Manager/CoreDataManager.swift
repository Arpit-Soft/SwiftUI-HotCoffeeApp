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
    
    private func fetchOrder(_ name: String) -> Order? {
        
        var orders = [Order]()
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        orderRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            orders = try moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders.first
    }
    
    func deleteOrder(_ name: String) {
        do {
            if let order = fetchOrder(name) {
                moc.delete(order)
                try moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func getAllOrders() -> [Order] {
        
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        return orders
    }
    
    func saveOrder(name: String, type: String) {
        
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
