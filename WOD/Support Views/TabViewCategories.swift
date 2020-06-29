//
//  TabViewCategories.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct TabViewCategories: View {
    
    @State var showContent = false
    @State var workout: Workout
    @State var showProfile = false
    
    var body: some View {
        
        TabView {
            CategoryHome(showProfile: $showProfile, workout: workout).tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            
            WODList().tabItem {
                Image(systemName: "list.bullet")
                Text("All")
            }
        }
    }
}

struct TabViewCategories_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCategories(workout: workoutData[0])
            .environmentObject(UserData())
    }
}
