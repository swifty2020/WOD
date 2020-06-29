//
//  Workout.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import SwiftUI

struct Workout: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var wodFormat: String
    var workoutDescription: String
    var category: Category
    var isFeatured: Bool
    var isMarked: Bool
    var categoryName: String
    var categoryDescription: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case chipper = "Chipper"
        case rft = "RFT"
        case emom = "EMOM"
        case ladder = "Ladder"
        case amrap = "AMRAP"
    }
}

extension Workout {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

