//
//  DessertListView.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-09.
//

import SwiftUI

struct DessertListView: View {
  @ObservedObject var viewModel: DessertListViewModel
  let client: HTTPClientProviding

  var body: some View {
    GeometryReader { proxy in
      NavigationStack {
        List(viewModel.desserts) { dessert in
          NavigationLink(
            value: dessert.idMeal,
            label: {
              DessertRow(dessert: dessert)
                .frame(width: proxy.size.width)
            }
          )
        }.navigationDestination(for: String.self) { id in
          DessertDetailView(id, client)
        }
      }.task {
        await viewModel.getDesserts()
      }
    }
  }
}

#Preview {
  DessertListView(viewModel: .preview(), client: HTTPClientMock())
}
