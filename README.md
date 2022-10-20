# ConcurrencyContinuationReproduce

Differences of Concurrency behaviors between Xcode 14.0 and 14.1

On Xcode 14.1

**`withCheckedContinuation`'s body will be run background thread in case of starting from main-actor.**

This situation happens only earlier than iOS 15. so 13.x and 14.x have this situation with Xcode 14.1.
Those OS versions are targets of back-deployments of Concurrency.

```swift
Task { @MainActor () -> Void in
  await withCheckedContinuation { c in    
    // >= iOS 15 : on main-thread
    // < iOS 15 : on background-thread
    c.resume()
  }
}
```

<img width="1009" alt="image" src="https://user-images.githubusercontent.com/1888355/196978627-0551ca65-882a-445d-abf9-4ef1511805a0.png">

Until Xcode 14.0(also 14.0.1) is fine. 
