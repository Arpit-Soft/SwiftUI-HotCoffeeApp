//
//  AddOrderView.swift
//  SwiftUI-HotCoffeeApp
//
//  Created by Arpit Dixit on 24/07/21.
//

import SwiftUI

struct AddOrderView: View {
    
    @Binding var isPresented: Bool
    @State var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        
        NavigationView {
            Group {
                
                VStack {
                    
                    TextField("Enter name", text: self.$addOrderVM.name)
                        .padding([.top, .bottom])
                    
                    Picker(selection: self.$addOrderVM.type, label: Text(""), content: {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("exp")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.top, .bottom])
                    
                    Button("Place Order") {
                        addOrderVM.saveOrder()
                        isPresented.toggle()
                    }.padding(8)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
