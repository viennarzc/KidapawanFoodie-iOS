//
//  SearchResultsView.swift
//  KidapawanFoodie
//
//  Created by Viennarz Curtiz on 4/15/22.
//

import SwiftUI

struct SearchResultsView: View {
    var items: [String]
    
    var body: some View {
            
            ScrollView {
                Section {
                    
                    ForEach(items, id: \.self) { item in
                        RestoCardItem(title: item)
                    }
                    
                } header: {
                    HStack {
                        Text("\(items.count) Restaurants")
                            .font(.title3.weight(.semibold))
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Restaurants")
            
        

    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(items: ["Cafe", "Brew"])
    }
}
