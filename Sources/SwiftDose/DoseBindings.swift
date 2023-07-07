//
//  DoseValues.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

/// Provides access to injected dependencies.
public struct DoseBindings {
    
    /// This is only used as an accessor to the computed properties within extensions of `DoseValues`.
    private static var current = DoseBindings()
    
    /// A static subscript for updating the `currentValue` of `DoseKey` instances.
    public static subscript<K>(key: K) -> K.Value where K : DoseKey {
        get { key.value }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    public static subscript<T, K>(_ keyPath: WritableKeyPath<DoseBindings, K>) -> K where K: DoseKey, T == K.Value {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
