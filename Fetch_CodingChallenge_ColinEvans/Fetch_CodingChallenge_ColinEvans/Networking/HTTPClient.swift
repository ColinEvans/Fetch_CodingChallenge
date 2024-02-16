//
//  HTTPClient.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-12.
//

import Foundation

/// An HTTP client which using structured concurrency
struct HTTPClient: HTTPClientProviding {
  /// The `AsyncTransport` which will be used to invoke each `HTTPRequest`
  private let transport: AsyncTransport
  
  /// Creates an `AsyncHTTPClient` with the given parameters
  ///
  /// - Parameter transport: The `AsyncTransport` which will be used to invoke each `HTTPRequest`
  init(transport: AsyncTransport = URLSession.shared) {
    self.transport = transport
  }
  
  /// Issues each `HTTPRequest` via the `AsyncTransport` and validates the result
  ///
  /// - Parameters:
  ///   - request: Any `HTTPRequest`
  /// - Returns: A decoded `Request.HTTPResponse` if returned from the service
  func response<Request: HTTPRequest>(
    for request: Request
  ) async throws -> Request.HTTPResponse {
    let urlRequest = createURLRequest(from: request)
    
    do {
      let result = try await transport.response(for: urlRequest)
      guard let httpResponse = result.1 as? HTTPURLResponse,
            (200..<300).contains(httpResponse.statusCode)  else {
        throw HTTPError.badResponse
      }

      return try JSONDecoder().decode(Request.HTTPResponse.self, from: result.0)
    } catch {
      throw HTTPError.invalidData
    }
  }
  
  // MARK: - Private functions
  private func createURLRequest(from request: some HTTPRequest) -> URLRequest {
    let url = URL(string: request.baseURL)!.addQueryItems(for: request.parameters)
    return URLRequest(url: url)
  }
}
