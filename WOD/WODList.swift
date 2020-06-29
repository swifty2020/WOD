//
//  WODList.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//


import SwiftUI

struct WODList: View {
    @EnvironmentObject private var userData: UserData
    @State var showMarkedOnly = true
    @State private var selection = 0
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Toggle(isOn: $userData.showMarkedOnly) {
                    Text("")
                }.toggleStyle(CustomToggle())
                
                ForEach(userData.workouts) { workout in
                    if !self.userData.showMarkedOnly || workout.isMarked {
                        NavigationLink(destination: WODDetail(workout: workout)
                            .environmentObject(self.userData)
                        ) {
                            WODRow(workout: workout)
                        }
                    }
                }
            }
            .navigationBarTitle("All Workouts")
            .listSeparatorStyle(style: .singleLine)
        }
    }
}

struct WODList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            WODList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

