//
//  DoseProvider.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

public protocol InstanceProvider: DoseKey where Value == Instance {
    associatedtype Instance
    
    static var savedValue: Instance? { get set }
    static func provide() -> Instance
}

public protocol SingletonProvider: DoseKey { }

extension InstanceProvider {
    static public var value: Instance {
        get {
            return savedValue ?? provide()
        }
        set {
            savedValue = newValue
        }
    }
}
