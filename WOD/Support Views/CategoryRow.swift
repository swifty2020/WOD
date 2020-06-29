//
//  CategoryRow.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Workout]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { workout in
                        NavigationLink(destination: WODDetail(workout: workout
                            )
                        ) {
                            GeometryReader { geometry in
                                CategoryItem(workout: workout)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 200, height: 200)
                        }
                    }
                }
                .padding(10)
                .padding(.leading, 10)
                .padding(.bottom, 10)
            }
            .frame(height: 200)
        }
    }
}

struct CategoryItem: View {
    
    var workout: Workout
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack {
                workout.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 200, height: 150)
            }
            VStack {
                Text(workout.name)
                    .foregroundColor(.primary)
                    .font(.system(size: 15))
                    .font(.caption)
                    
                    .padding(.leading, 20)
            }
            
        }
            
        .padding(.horizontal, 15)
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3), radius: -20, x: 0, y: -20)
        .padding(10)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: workoutData[0].category.rawValue, items: Array(workoutData.prefix(4))
        )
    }
}
