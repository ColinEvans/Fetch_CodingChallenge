//
//  IngredientRow.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import SwiftUI

struct IngredientRow: View {
  let ingredient: String
  var isLastRow = false

  var body: some View {
    VStack(spacing: UIConstants.verticalSpacing) {
      HStack(spacing: UIConstants.horizontalSpacing) {
        Image(systemName: "checkmark.circle")
          .foregroundColor(Color.red)
          .font(.subheadline)
        
        Text(ingredient)
          .font(.subheadline)
      }
      .padding(.leading)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      if !isLastRow {
        Rectangle()
          .background(Color(UIColor.systemGray6))
          .frame(height: UIConstants.separatorHeight)
          .padding([.leading, .trailing])
      }
    }
  }
  
  private struct UIConstants {
    static let verticalSpacing: CGFloat = 5
    static let horizontalSpacing: CGFloat = 15
    static let separatorHeight: CGFloat = 1
  }
}

#Preview {
  IngredientRow(ingredient: "2 large eggs")
}
