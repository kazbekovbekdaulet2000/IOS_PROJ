//
//  ButtonStyles.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation
import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
    }
    .scaleEffect(configuration.isPressed ? 1.03 : 1)
    .animation(.linear(duration: 0.1), value: 1)
  }
}
