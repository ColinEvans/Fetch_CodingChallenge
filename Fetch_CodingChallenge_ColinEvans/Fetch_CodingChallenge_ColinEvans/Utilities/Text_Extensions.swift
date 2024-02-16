//
//  Text_Extensions.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation
import SwiftUI

extension Text {
  func captionText() -> some View {
    self
      .font(.title2)
      .bold()
      .padding(.bottom)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}
