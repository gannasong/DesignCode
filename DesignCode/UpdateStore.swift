//
//  UpdateStore.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/6.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
  @Published var updates: [Update] = updateData
}
