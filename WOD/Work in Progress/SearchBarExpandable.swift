//
//  SearchBarExpandable.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

//import SwiftUI
//import UIKit
//import Foundation
//
//
//struct SearchBarExp: View {
//    var body: some View {
//        SearchBarExpandable()
//    }
//}
//
//struct SearchBarExp_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarExpandable()
//    }
//}
//
//struct SearchBarExpandable : View {
//
//    @State var show = false
//    @State var txt = ""
//    @State var data = ["fkkfkf"]
//
//
//    var body : some View{
//
//        VStack(spacing: 0) {
//
//            HStack{
//
//                if !self.show{
//
//                }
//
//                Spacer(minLength: 0)
//
//                HStack{
//
//                    if self.show{
//
//                        Image("search").padding(.horizontal, 8)
//
//                        TextField("Search", text: self.$txt)
//
//                        Button(action: {
//
//                            withAnimation {
//
//                                self.txt = ""
//                                self.show.toggle()
//                            }
//
//                        }) {
//
//                            Image(systemName: "xmark").foregroundColor(.black)
//                        }
//                        .padding(.horizontal, 8)
//
//                    }
//
//                    else{
//
//                        Button(action: {
//
//                            withAnimation {
//
//                                self.show.toggle()
//                            }
//
//                        }) {
//
//                            Image("search").foregroundColor(.black).padding(10)
//
//                        }
//                    }
//                }
//                .padding(self.show ? 10 : 0)
//                .background(Color.white)
//                .cornerRadius(20)
//
//
//            }
//            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
//            .padding(.horizontal)
//            .padding(.bottom, 10)
//            .background(Color.orange)
//
//
////            ScrollView(.vertical, showsIndicators: false) {
////
//                VStack(spacing: 15){
//
//                    if self.txt != "" {
//                        if
//                            data.filter({$0.lowercased().contains(self.txt.lowercased())}).count == 0{
//                            Text("No Results").padding(.top, 10)
//                        } else {
//                            ForEach(data.filter({$0.lowercased().contains(self.txt.lowercased())}), id: \.self) { i in
//                                cellView(image: i)
//
//                            }
//                        }
//                    }
////
////                    else {
////                        ForEach(data, id: \.self) { i in
////                                               cellView(image: i)
////                    }
////
//
////                        ZStack(alignment: .bottomTrailing) {
////                            Image(i).resizable().frame(height: 200).cornerRadius(20)
////
////                            Button(action: {
////
////                            }) {
////                                Image(systemName: "arrow.right").foregroundColor(.black).padding()
////                            }
////                            .background(Color.white)
////                                             .clipShape(Circle())
////                                             .padding()
//                        }
//
////                    }
//
////                }
////                .padding(.horizontal, 15)
////                .padding(.top, 10)
//            }
//
//
//        }
////        .edgesIgnoringSafeArea(.top)
////    }
//}
//
//
//struct cellView : View {
//
//    var image: String
//
//    var body : some View {
//
//        ZStack(alignment: .bottomTrailing) {
//
//            Image(image).resizable().frame(height: 200).cornerRadius(20)
//
//
//            Button(action: {
//
//            }) {
//
//                Image(systemName: "arrow.right").foregroundColor(.black).padding()
//            }
//            .background(Color.white)
//            .clipShape(Circle())
//            .padding()
//
//        }
//    }
//}
//
////class Host: UIHostingController<ContentView> {
////
////    override var preferredStatusBarStyle: UIStatusBarStyle{
////
////        return .lightContent
////    }
////}
