//
//  Image_Extensions.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import SwiftUI

extension Image {
  func iconImage(_ radius: CGFloat = 10, size: CGFloat = 80) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: size, height: size)
      .cornerRadius(radius)
  }
}
