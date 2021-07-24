//
//  OrderListViewModel.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 24/07/21.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
        print(orders)
    }
    
    func deleteOrder(_ orderListVM: OrderViewModel) {
        CoreDataManager.shared.deleteOrder(orderListVM.name)
        fetchAllOrders()
    }
}

class OrderViewModel {
    let name: String
    let type: String
    
    init(order: Order) {
        self.name = order.name ?? ""
        self.type = order.type ?? ""
    }
}


