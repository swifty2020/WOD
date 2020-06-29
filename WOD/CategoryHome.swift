//
//  CategoryHome.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//


import SwiftUI
import UIKit

struct CategoryHome: View {
    
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @State var workout: Workout
    
    var categories: [String: [Workout]] {
        Dictionary(grouping: workoutData, by: { $0.category.rawValue }
        )
    }
    
    var featured: [Workout] {
        workoutData.filter { $0.isFeatured }
    }
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                
                List {
                    
                    FeaturedWorkouts(workouts: featured)
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                    
                    
                    ForEach(categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                }
                    
                .listSeparatorStyle(style: .none)
                    
                .navigationBarTitle(Text("Categories"))
                .navigationBarItems(trailing:
                    HStack {
                        
                        Button(action: {self.showUpdate.toggle() }) {
                            Image(systemName: "rectangle.stack")
                                .foregroundColor(Color.blue)
                                // .renderingMode(.original)
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 36, height: 36)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                        }
                        .sheet(isPresented: $showUpdate) {
                            ContentView()
                        }
                    }
                    .padding(.horizontal, 5)
                )
            }
        }
    }
}

struct FeaturedWorkouts: View {
    var workouts: [Workout]
    var body: some View {
        workouts[0].image.resizable()
    }
}
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(showProfile: .constant(false), workout: workoutData[0])
            .environmentObject(UserData())
    }
}

struct ListSeparatorStyle: ViewModifier {
    
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView.appearance().separatorStyle = self.style
        }
    }
}

extension View {
    
    func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
        ModifiedContent(content: self, modifier: ListSeparatorStyle(style: style))
    }
}
