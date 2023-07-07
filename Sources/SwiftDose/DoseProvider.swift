//
//  DoseProvider.swift
//  
//
//  Created by Artur Hellmann on 09.02.23.
//

import Foundation

public protocol InstanceProviderProtocol: DoseKey where Value == Instance {
    associatedtype Instance
    
    var savedValue: Instance? { get set }
    func provide() -> Instance
}

public protocol SingletonProviderProtocol: DoseKey { }

extension InstanceProviderProtocol {
    public var value: Instance {
        get {
            return savedValue ?? provide()
        }
        set {
            savedValue = newValue
        }
    }
}

public class SingletonProvider<ValueType>: SingletonProviderProtocol {
    public var value: ValueType
    
    public init(_ singleton: ValueType) {
        self.value = singleton
    }
}

public class InstanceProvider<ValueType>: InstanceProviderProtocol {
    public var savedValue: ValueType?
    
    private var providerBlock: () -> ValueType
    
    public init(providerBlock: @escaping () -> ValueType) {
        self.providerBlock = providerBlock
    }
    
    public func provide() -> ValueType {
        self.providerBlock()
    }
}
