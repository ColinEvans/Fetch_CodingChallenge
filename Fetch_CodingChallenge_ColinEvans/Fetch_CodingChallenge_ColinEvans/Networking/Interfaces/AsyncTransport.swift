//
//  AsyncTransport.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-12.
//

import Foundation

/// Carries `Data` from the network via async/await
protocol AsyncTransport {
  /// Invokes the provided `URLRequest` and converts the result to a ClientResponse of `(Data, URLResponse)`
  ///
  /// - Parameter request: Any `URLRequest`
  /// - Returns: `Data` and a `URLResponse`
  func response(for request: URLRequest) async throws -> (Data, URLResponse)
}
