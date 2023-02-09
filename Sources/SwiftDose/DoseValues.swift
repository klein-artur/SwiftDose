//
//  DoseValues.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

/// Provides access to injected dependencies.
public struct DoseValues {
    
    /// This is only used as an accessor to the computed properties within extensions of `DoseValues`.
    private static var current = DoseValues()
    
    /// A static subscript for updating the `currentValue` of `DoseKey` instances.
    public static subscript<K>(key: K.Type) -> K.Value where K : DoseKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    public static subscript<T>(_ keyPath: WritableKeyPath<DoseValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
