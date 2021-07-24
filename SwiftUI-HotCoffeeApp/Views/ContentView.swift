//
//  ContentView.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    @State private var isPresented = false
    
    init() {
        orderListVM = OrderListViewModel()
    }
    
    private func delete(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let orderVM = orderListVM.orders[index]
            orderListVM.deleteOrder(orderVM)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(orderListVM.orders, id: \.name) { orderVM in
                    HStack {
                        Image(orderVM.type)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10.0)
                        Text(orderVM.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(trailing: Button("Add New Order") {
                isPresented.toggle()
            })
            .sheet(isPresented: $isPresented, onDismiss: {
                orderListVM.fetchAllOrders()
            }, content: {
                AddOrderView(isPresented: $isPresented)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
