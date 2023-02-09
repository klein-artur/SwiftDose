# SwiftDose

A very lightweight dependency injection for swift. 

To use it:

For every type you want to inject create a provider for either Singletons or new instances every time.
The instance injection will create a new instance per new @Dose injection:

``` swift

/// Singleton:
struct SomeSingletonProvider: SingletonProvider {
    static var value: SomeSingleton = SomeSingleton()
}

/// New Instance:
struct SomeInstanceProvider: InstanceProvider {
    static var savedValue: SomeInstance?
    static func provide() -> SomeInstance {
        SomeInstance()
    }
}

```

Then you need to register your instances to the injection:

``` swift

private var someSingletonProvider = SomeSingletonProvider()
private var someInstanceProvider = SomeInstanceProvider()

extension DoseValues {
    var someSingleton: SomeSingletonProvider {
        get { someSingletonProvider }
        set { someSingletonProvider = newValue }
    }
    var someInstance: SomeInstanceProvider {
        get { someInstanceProvider }
        set { someInstanceProvider = newValue }
    }
}

```

Then you can use it everywhere like this:

```
class SomeClass {
    @Dose(\.someSingleton) var theSingleton
    @Dose(\.someInstance) var theInstance
}
```

If you want to override the given providers with new values you can to it like this (for example for testing or previews):

```
DoseValues[SomeSingletonProvider.self] = theOtherInstance
```

Overriding a new instance provider will never create a new instance anymore.
