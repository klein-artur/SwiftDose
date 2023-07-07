//
//  DoseKey.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

public protocol DoseKey {
    
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value
    
    /// The default value for the dependency injection key.
    var value: Self.Value { get set }
    
}

extension DoseKey {
    func get() -> Value {
        self.value
    }
    
    mutating func set(value: Value) {
        self.value = value
    }
}
