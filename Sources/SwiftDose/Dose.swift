//
//  Dose.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

@propertyWrapper
public class Dose<T, K> where K: DoseKey, T == K.Value {
    private let keyPath: WritableKeyPath<DoseValues, K>
    
    private var savedValue: T? = nil
    
    public var wrappedValue: T {
        get {
            let provider: K = DoseValues[keyPath]
            if provider is (any InstanceProvider) {
                savedValue = savedValue ?? provider.get()
                return savedValue!
            } else {
                return provider.get()
            }
        }
        set { DoseValues[keyPath].set(value: newValue) }
    }
    
    public init(_ keyPath: WritableKeyPath<DoseValues, K>) {
        self.keyPath = keyPath
    }
}
