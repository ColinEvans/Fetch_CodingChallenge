//
//  DessertDetailCache.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation

class DessertDetailCache {
  static var shared = NSCache<NSString, StructWrapper<DessertDetail>>()
}

/// `Struct` wrapper to wrap objects within the `NSCache`
class StructWrapper<T>: NSObject {
  let value: T
  
  init(_ value: T) {
    self.value = value
  }
}
