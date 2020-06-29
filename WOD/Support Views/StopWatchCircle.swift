//
//  StopWatchCircle.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct StopWatchCircle: View {
    
    @ObservedObject var stopWatch = StopWatch()
    
    var body: some View {
        
        VStack {
            GeometryReader { geo in
                Text(self.stopWatch.stopWatchTime)
                    .font(.custom("SF Pro Rounded", size: 60))
                    .foregroundColor(.primary)
                    .frame(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.height/2, alignment: .center)
                    .padding()
                    
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                            
                            Circle()
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                                .padding(2)
                                .blur(radius: 2)
                        }
                )
                    .clipShape(Circle())
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            }
        }
    }
}

