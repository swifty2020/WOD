//
//  WODDetail.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//


import UIKit
import SwiftUI


struct WODDetail : View {
    
    @EnvironmentObject var userData: UserData
    @ObservedObject var stopWatch = StopWatch()
    
    var workout: Workout
    
    var body: some View {
        
        VStack {
            VStack {
                VStack  {
                    StopWatchCircle()
                }
                .padding(.top, 20)
            }
                
            .frame(width: 400, height: 400)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 10, x: 10, y: 10)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
                .overlay(TwoStopWatchButtons().offset(y: 195).padding(.horizontal, 30))
                .overlay(AnimatedHeart(workout: workout).offset(y: 197))
            
            VStack {
                
                VStack {
                    
                    VStack(alignment: .center) {
                        Text(workout.name)
                            .font(.custom("SF Mono", size: 30))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                        
                        // line separator
                        Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                            .frame(width: 350, height: 1)
                    }
                    
                    VStack(alignment: .center) {
                        Text(workout.wodFormat)
                            .font(.custom("SF Mono", size: 20))
                            .foregroundColor(.black)
                    }
                    
                    VStack(alignment: .center) {
                        ScrollView {
                            Text(workout.workoutDescription)
                                .font(.custom("SF Mono", size: 18))
                                .foregroundColor(.black)
                                .padding(.bottom, 8)
                        }
                    }
                }
                    
                .background(
                    ZStack {
                        Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(ColorManager.antiFlashWhite)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 10, x: 10, y: 10)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
                
            }
            .offset(y: 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WODDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return WODDetail(workout: userData.workouts[0])
            .environmentObject(userData)
    }
}

struct AnimatedHeart: View {
    
    @EnvironmentObject var userData: UserData
    @ObservedObject var stopWatch = StopWatch()
    
    var workout: Workout
    var workoutIndex: Int {
        userData.workouts.firstIndex(where: { $0.id == workout.id })!
    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.userData.workouts[self.workoutIndex].isMarked.toggle()
            }) {
                if self.userData.workouts[self.workoutIndex].isMarked {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "heart.fill")
                        .foregroundColor(ColorManager.slateGray)
                }
            }
        }
        .padding(.top, 10).padding(.bottom, 5)
    }
}
