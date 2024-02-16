//
//  DessertRow.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation
import SwiftUI

struct DessertRow: View {
  let dessert: Dessert
  @Environment(\.displayScale) var scale
  
  var body: some View {
    HStack(spacing: UIConstants.spacing) {
      GeometryReader { proxy in
        Text(dessert.strMeal)
          .frame(maxWidth: proxy.size.width * 0.75, maxHeight: .infinity, alignment: .leading)
          .font(.system(size: UIConstants.fontSize))
          .bold()
          .padding(.leading, UIConstants.spacing)
      }
      if let imageURL = URL(string: dessert.strMealThumb) {
        AsyncImage(
          url: imageURL,
          scale: scale,
          transaction: .init(animation: .bouncy)
        ) { phase in
          switch phase {
          case .success(let image):
            image
              .iconImage(UIConstants.cornerRadius)
              .padding(.trailing, UIConstants.spacing)
          default:
            Image("placeholder_image")
              .iconImage(UIConstants.cornerRadius)
              .padding(.trailing, UIConstants.spacing)
          }
        }
      }
    }.padding(UIConstants.spacing)
  }
  
  private struct UIConstants {
    static let spacing: CGFloat = 20
    static let fontSize: CGFloat = 16
    static let cornerRadius: CGFloat = 15
  }
}

#Preview {
  DessertRow(dessert: .preview())
}
