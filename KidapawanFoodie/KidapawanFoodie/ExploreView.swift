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
    @State var isSearching: Bool = false
    @State var searchResultSectionTitle: String = ""
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical) {
                Spacer(minLength: 16)
                
//                if isSearchResultsShown {
//                    SearchResultsView(items: $filteredRestaurants)
//                        .padding(.horizontal)

//                        .transition(.scale.animation(.easeInOut))
//                } else {
                ExploreContentView(items: filteredRestaurants, numberOfResults: isSearching ? filteredRestaurants.count : restaurants.count, isSearching: $isSearching)
//                        .transition(.scale.animation(.easeInOut))
                    
//                }
                
            }
                
            
        }
        .searchable(
            text: $searchValue,
            placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for Cafe and Restaurant") {
            
        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.large)
        
        .onAppear(perform: {
            filteredRestaurants = Array(restaurants.prefix(3))
        })
        
        .onChange(of: searchValue) { val in
            if val.isEmpty {
                filteredRestaurants = Array(restaurants.prefix(3))
                isSearching = false
                return
            }
            
            isSearching = true
            
            let filtered = restaurants.filter({ $0.contains(searchValue) })
            
            filteredRestaurants = Array(filtered.prefix(3))

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

struct RestoCardItem: View {
    var title: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("coffeeshop")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(height: UIScreen.main.bounds.height / 4)
            
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .clear]), startPoint: .bottom, endPoint: .center)
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
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
}


struct Restaurant: Identifiable {
    let id: Int
    let name: String
    let businessHours: String
    let address: Address
    let contactNumbers: [Int]
}


struct Address {
    let name: String
    let longtitude: String
    let latitude: String
    
}

struct ExploreContentView: View {
    var items: [String]
    var numberOfResults: Int
    
    @Binding var isSearching: Bool 
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            
            if !isSearching {
                HStack {
                    ExploreCardItemView(title: "Restaurants", iconName: "test")
                    ExploreCardItemView(title: "Snacks", iconName: "test")
                    ExploreCardItemView(title: "Ice-cream", iconName: "test")
                    ExploreCardItemView(title: "Cafe", iconName: "test")
                }
                
                .frame(height: 100)
                .navigationTitle("Explore")
                
            }
            
            Spacer(minLength: 16)
            
            Section {
                ForEach(items, id: \.self) { item in
                    
                    RestoCardItem(title: item)
                    
                }
            } header: {
                HStack {
                    Text("\(numberOfResults) Restaurants")
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
