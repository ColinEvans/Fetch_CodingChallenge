 //
//  Fetch_CodingChallenge_ColinEvansApp.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-09.
//

import SwiftUI

@main
struct Fetch_CodingChallenge_ColinEvansApp: App {
  let assembly = FetchAssembly()
  
  var body: some Scene {
    WindowGroup {
      DessertListView(viewModel: assembly.contentViewModel, client: assembly.client)
    }
  }
}
