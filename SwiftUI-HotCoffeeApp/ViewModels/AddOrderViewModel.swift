//
//  AddOrderViewModel.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 24/07/21.
//

import Foundation

struct AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: name, type: type)
    }
}


