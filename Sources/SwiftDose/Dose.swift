//
//  Dose.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

@propertyWrapper
public class Dose<K: DoseKey> {
    private let keyPath: WritableKeyPath<DoseBindings, K>
    
    private var savedValue: K.Value? = nil
    
    public var wrappedValue: K.Value {
        get {
            let provider: K = DoseBindings[keyPath]
            if provider is (any InstanceProviderProtocol) {
                savedValue = savedValue ?? provider.get()
                return savedValue!
            } else {
                return provider.get()
            }
        }
        set { DoseBindings[keyPath].set(value: newValue) }
    }
    
    public init(_ keyPath: WritableKeyPath<DoseBindings, K>) {
        self.keyPath = keyPath
    }
}
