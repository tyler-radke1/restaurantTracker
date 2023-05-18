//
//  CreateRestaurantView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct CreateRestaurantView: View {
    init() {
        
    }
    @State var restName: String = ""
    var body: some View {
        VStack {
            //Restaurant Name
            VStack {
                Spacer()
                Text("Restaurant Name")
                TextField("Name", text: $restName)
                    .frame(width: 340)
                Spacer()
                Divider()
            }
            
            VStack {
                Button("Add Restaurant") {
                    
                }
                
                
            }
            
            
        }
        .navigationTitle("Add Restaurant")
        .background(Color.tanCustom)
    }
}

struct CreateRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRestaurantView()
    }
}
