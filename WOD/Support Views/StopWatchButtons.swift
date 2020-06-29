//
//  StopWatchButtons.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//


import UIKit
import SwiftUI

struct StopWatchButton : View {
    
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    
    
    var body: some View {
        
        let buttonWidth = (UIScreen.main.bounds.size.width / 4) - 10
        let buttonHeight = (UIScreen.main.bounds.size.width / 4) - 10
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
                
            } else {
                self.actions[1]()
                
            }
        }) {
            if isPaused {
                
                Text(self.labels[0])
                    .font(.custom("Calibri", size: 16))
                    .bold()
                    .foregroundColor(.primary)
            } else {
                Text(self.labels[1])
                    .font(.custom("Calibri", size: 16))
                    .foregroundColor(.primary)
            }
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .background(self.color)
    }
}

struct TwoStopWatchButtons : View {
    
    @ObservedObject var stopWatch = StopWatch()
    
    var body: some View {
        
        ZStack {
            HStack {
                StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause], labels: ["START", "PAUSE"], color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.5), isPaused: self.stopWatch.isPaused())
                    
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                                .padding(2)
                                .blur(radius: 2)
                        }
                )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                
                Spacer()
                
                StopWatchButton(actions: [self.stopWatch.reset, self.stopWatch.record], labels: ["RESET", "RECORD"], color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.5), isPaused: self.stopWatch.isPaused())
                    
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                                .padding(2)
                                .blur(radius: 2)
                        }
                )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            }
            .padding(.horizontal, 30)
        }
    }
}
