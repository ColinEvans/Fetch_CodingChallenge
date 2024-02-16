//
//  DessertDetailView.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-14.
//

import SwiftUI

struct DessertDetailView: View {
  @StateObject var detailViewModel: DessertDetailViewModel
  
  init(_ id: String, _ client: some HTTPClientProviding) {
    _detailViewModel = StateObject(
      wrappedValue: DessertDetailViewModel(id: id, client: client)
    )
  }
  
  var body: some View {
    Group {
      if let error = detailViewModel.error {
        Text(error)
      } else {
        detailView
      }
    }.task {
      await detailViewModel.getDetail()
    }
  }
  
  // MARK: - Details View
  private var detailView: some View {
    GeometryReader { proxy in
      ScrollView {
        VStack(spacing: proxy.size.height * 0.05) {
          if let dessertDetail = detailViewModel.dessertDetail {
            Text(dessertDetail.strMeal ?? "")
              .font(.title)
              .bold()
            
            instructions(for: dessertDetail.strInstructions ?? "")
            ingredientMeasurements
          } else {
            ProgressView()
          }
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing])
      }
    }
  }
  
  private func instructions(for instructions: String) -> some View {
    VStack {
      Text("Instructions:")
        .captionText()
      Text(instructions)
        .font(.body)
    }
  }
  
  private var ingredientMeasurements: some View {
    LazyVStack {
      Text("Ingredients:")
        .captionText()
      ForEach(detailViewModel.ingredientMeasurements) { pair in
        IngredientRow(
          ingredient: "\(pair.measurement) \(pair.ingredient)",
          isLastRow: detailViewModel.isLastIngredient(for: pair)
        )
      }
    }
  }
  
}

#Preview {
  DessertDetailView("42", HTTPClientMock())
}
