//
//  SearchBar.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

//import SwiftUI
//import Foundation
//import UIKit
//
//struct SearchBar: UIViewRepresentable {
//
//    @Binding var text: String
//
//    class Coordinator: NSObject, UISearchBarDelegate {
//
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//        func searchBar(_searchBar: UISearchBar, textDidChange searchText: String) {
//             text = searchText
//         }
//    }
//    func makeCoordinator() -> SearchBar.Coordinator {
//               return Coordinator(text: $text)
//    }
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//            let searchBar = UISearchBar(frame: .zero)
//            searchBar.delegate = context.coordinator
//            return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        uiView.text = text
//    }
//}
//
