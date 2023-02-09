//
//  Dose.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

@propertyWrapper
struct Dose<T> {
    private let keyPath: WritableKeyPath<DoseValues, T>
    var wrappedValue: T {
        get { DoseValues[keyPath] }
        set { DoseValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<DoseValues, T>) {
        self.keyPath = keyPath
    }
}
