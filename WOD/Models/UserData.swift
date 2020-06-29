//
//  UserData.swift
//  WOD
//
//  Created by Tech on 6/29/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showMarkedOnly = false
    @Published var workouts = workoutData
}
