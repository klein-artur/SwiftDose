# SwiftDose

A very lightweight dependency injection for swift. 

To use it:

For every type you want to inject create a provider for either Singletons or new instances every time.
The instance injection will create a new instance per new @Dose injection:

``` swift

private var someSingletonProvider = SingletonProvider(SomeSingleton())
private var someInstanceProvider = InstanceProvider {
    SomeInstance()
}
private var instanceProcotolProvider = InstanceProvider<any Protocol> {
    SomeProtocolImplementation()
}

extension DoseBindings {
    var someSingleton: SingletonProvider<SomeSingleton> {
        get { someSingletonProvider }
        set { someSingletonProvider = newValue }
    }
    var someInstance: InstanceProvider<SomeInstance> {
        get { someInstanceProvider }
        set { someInstanceProvider = newValue }
    }
    var someProtocol: InstanceProvider<any Protocol> {
        get { instanceProcotolProvider }
        set { instanceProcotolProvider = newValue }
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
DoseBindings[\.someSingleton] = SingletonProvider(theOtherInstance)
```

