//
//  ExploreView.swift
//  KidapawanFoodie
//
//  Created by Viennarz Curtiz on 4/14/22.
//

import SwiftUI
import Combine

struct ExploreView: View {
    @State var searchValue: String = ""
    @State var restaurants: [String] = [
        "Restaurant 1",
        "Restaurant 2",
        "Restaurant 3",
        "Restaurant 4",
        "Restaurant 5",
        "Burger",
        "Noodles",
        "Japanese",
        "Grill",
        "Sandwich",
        "Tuna",
        "Coffee",
        "Nikkos Brew"
    ]
    
    @State var filteredRestaurants: [String] = []
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical) {
                
                LazyVStack(alignment: .leading) {
                    
                    HStack {
                        ExploreCardItemView(title: "Restaurants", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                    }
                    
                    .frame(height: 100)
                    .navigationTitle("Explore")
                    
                    ForEach(filteredRestaurants, id: \.self) { item in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item)
                                    .font(.body)
                                Text("Address 123")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color(UIColor.systemGray6)))
                    }
                    
                }
            }.padding(.horizontal)
                
            
        }
        .searchable(
            text: $searchValue,
            placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for Cafe and Restaurant") {
            
        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.large)
        
        .onAppear(perform: {
            filteredRestaurants = restaurants
        })
        
        .onChange(of: searchValue) { val in
            if val.isEmpty {
                filteredRestaurants = restaurants
                return
            }
            
            filteredRestaurants = restaurants.filter({ $0.contains(searchValue) })

        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

struct ExploreCardItemView: View {
    var title: String
    var iconName: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            LinearGradient(gradient: Gradient(colors: [.teal, .blue]), startPoint: .bottom, endPoint: .top)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3.bold())
                    

            }
            .foregroundColor(.white)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
