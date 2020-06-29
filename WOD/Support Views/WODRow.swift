//
//  WODRow.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct WODRow: View {
    var workout: Workout
    
    var body: some View {
        HStack {
            workout.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
                .shadow(radius: 5)
            
            
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(workout.name)
                Text("Add description info.")
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                Text("more info")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8)
            
            Spacer()
            
            if workout.isMarked {
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct WODRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WODRow(workout: workoutData[0])
            WODRow(workout: workoutData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}


