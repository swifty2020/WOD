//
//  CustomToggle.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct CustomToggle: ToggleStyle {
    
    let width: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            
            
            Spacer()
            
            
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(configuration.isOn ? Color(#colorLiteral(red: 0.7501382003, green: 0.8278710353, blue: 1, alpha: 1)) : ColorManager.lightGray)
                
                Image(systemName: "heart.fill")
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                }
            }
        }
        .accessibility(activationPoint: configuration.isOn ? UnitPoint(x: 0.25, y: 0.5) : UnitPoint(x: 0.75, y: 0.5))
        .alignmentGuide(.leading, computeValue: { d in (d.width - self.width) })
        
    }
}



