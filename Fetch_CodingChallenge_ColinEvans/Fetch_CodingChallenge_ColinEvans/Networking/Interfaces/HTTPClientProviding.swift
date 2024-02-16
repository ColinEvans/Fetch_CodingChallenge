//
//  HTTPClientProviding.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation

/// An HTTP client which using structured concurrency
protocol HTTPClientProviding {
  
  /// Issues each `HTTPRequest` via the `AsyncTransport` and validates the result
  ///
  /// - Parameters:
  ///   - request: Any `HTTPRequest`
  /// - Returns: A decoded `Request.HTTPResponse` if returned from the service
  func response<Request: HTTPRequest>(
    for request: Request
  ) async throws -> Request.HTTPResponse
}
