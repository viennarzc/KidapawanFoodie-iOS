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
                Spacer(minLength: 16)
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    
                    HStack {
                        ExploreCardItemView(title: "Restaurants", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                        ExploreCardItemView(title: "Coffee Shop", iconName: "test")
                    }
                    
                    .frame(height: 100)
                    .navigationTitle("Explore")
                    
                    Spacer(minLength: 16)
                    
                    Section {
                        ForEach(filteredRestaurants, id: \.self) { item in
                            
                            ZStack(alignment: .bottom) {
                                Image("coffeeshop")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .frame(height: UIScreen.main.bounds.height / 4)
                                
                                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .clear]), startPoint: .bottom, endPoint: .center)
                                
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item)
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                        Text("Address 123")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        
                                        Label("See on Map", systemImage: "map")
                                            .font(.caption.bold())
                                            .padding()
                                            .background(Capsule().fill(Color.white))
                                            
                                    }
                                    

                                    
                                }
                                .padding()
                                
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .contentShape(RoundedRectangle(cornerRadius: 16))
                            
                        }
                    } header: {
                        HStack {
                            Text("Restaurants")
                                .font(.title3.weight(.semibold))
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See all")
                                
                            }

                            
                        }
                        
                    }
                }.padding(.horizontal)
            }
                
            
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
