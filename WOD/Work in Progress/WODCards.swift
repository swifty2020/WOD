//
//  WODCards.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//


import SwiftUI

struct WODCards: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    
    var body: some View {
        ZStack {
            WODBackgroundView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                    //                    .speed(2)
                    //                    .repeatForever()
            )
            
            AMRAPWODBackCardView()
                .frame(width: showCard ? 310 : 280, height: 220)
                .background(show ? Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)) : Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -50)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -200 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                // .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            EMOMWODBackCardView()
                .frame(width: showCard ? 330 : 320, height: 220)
                .background(show ? Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)) : Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -300 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                // .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            RFTWODBackCardView()
                .frame(width: showCard ? 350 : 350, height: 220)
                .background(show ? Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)) : Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -30)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -160 : 0)
                .scaleEffect(showCard ? 1 : 0.91)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                // .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            
            LadderWODBackCardView()
                .frame(width: showCard ? 360 : 340, height: 220)
                .background(show ? Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)) : Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -100 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                //.blendMode(.hardLight)
                .animation(.easeOut(duration: 0.3))
            
            ChipperWODCardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                //                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                //.blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.show = false
                }
            )
            
            //            Text("\(bottomState.height)")
            //                .offset(y: -300)
            
            WODBottonCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 10 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -300
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
            )
        }
    }
}

struct WODCards_Previews: PreviewProvider {
    static var previews: some View {
        WODCards()
    }
}

struct ChipperWODCardView: View {
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Chipper")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    //                    Text(workout.wodFormat)
                    //                        .foregroundColor(.white)
                }
                Spacer()
                //                Image(systemName: "heart")
                //                    .foregroundColor(.white)
                //                if workout.isMarked {
                //                    Image(systemName: "heart.fill")
                //                        .imageScale(.medium)
                //                        .foregroundColor(.red)
                //                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("chipperimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
    }
}

struct LadderWODBackCardView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Ladder")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    //                    Text(workout.wodFormat)
                    //                        .foregroundColor(.white)
                }
                Spacer()
                //                Image(systemName: "heart")
                //                    .foregroundColor(.white)
                //                if workout.isMarked {
                //                             Image(systemName: "heart.fill")
                //                                 .imageScale(.medium)
                //                                 .foregroundColor(.red)
                //                         }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("ladderimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        
    }
}

struct RFTWODBackCardView: View {
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("RFT")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    //                    Text(workout.wodFormat)
                    //                        .foregroundColor(.white)
                }
                Spacer()
                //                Image(systemName: "heart")
                //                    .foregroundColor(.white)
                //                if workout.isMarked {
                //                    Image(systemName: "heart.fill")
                //                        .imageScale(.medium)
                //                        .foregroundColor(.red)
                //                         }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("rftimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        
    }
}

struct EMOMWODBackCardView: View {
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("EMOM")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    //                    Text(workout.wodFormat)
                    //                        .foregroundColor(.white)
                }
                Spacer()
                //                Image(systemName: "heart")
                //                    .foregroundColor(.white)
                //                if workout.isMarked {
                //                             Image(systemName: "heart.fill")
                //                                 .imageScale(.medium)
                //                                 .foregroundColor(.red)
                //                         }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("emomimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        
    }
}
struct AMRAPWODBackCardView: View {
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("AMRAP")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    //                    Text(workout.wodFormat)
                    //                        .foregroundColor(.white)
                }
                Spacer()
                //                Image(systemName: "heart")
                //                    .foregroundColor(.white)
                //                if workout.isMarked {
                //                             Image(systemName: "heart.fill")
                //                                 .imageScale(.medium)
                //                                 .foregroundColor(.red)
                //                         }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("amrapimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        
    }
}





struct WODBackgroundView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Workout Types")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("background1")
                .resizable()
                .opacity(0.2)
                .contrast(5)
                .scaledToFit()
                .opacity(0.4)
            Spacer()
        }
    }
}

struct WODBottonCardView: View {
    
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("The name Chipper describes a workout that combines a lot of different movements at high volume. You complete all reps assigned for each exercise before moving on to the next. Unlike the circuits seen in a lot of CrossFit workouts, a Chipper is performed only once. The best approach is to work methodically through each exercise. If you’re not competing in the CrossFit Games themselves, there’s no need to hammer away at top speed; Chippers are brutal regardless, so pace yourself.")
                .multilineTextAlignment(.leading)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
