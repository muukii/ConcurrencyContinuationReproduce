# ConcurrencyContinuationReproduce

Differences of Concurrency behaviors between Xcode 14.0 and 14.1

- Xcode 14.0
  - iOS 13+: Runs on main (inherited same context)

- Xcode 14.1 RC.1
  - iOS 15+: Runs on main (inherited same context)
  - iOS 14: Runs on background (hops to different context)
  - iOS 13: Crashes 

- Xcode 14.1 RC.2
  - iOS 15+: Runs on main (inherited same context)
  - iOS 14: Runs on background (hops to different context)
  - iOS 13: Runs on background

- Xcode 14.1 Release
  - iOS 15+: Runs on main (inherited same context)
  - iOS 14: Runs on background (hops to different context)
  - iOS 13: Runs on background

- Xcode 14.2 (✅ Fixed)
  - iOS 13+: Runs on main (inherited same context)


On Xcode 14.1

**`withCheckedContinuation`'s body will run on background thread in case of starting from main-actor.**

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


<img width="1108" alt="CleanShot 2022-10-25 at 16 54 07@2x" src="https://user-images.githubusercontent.com/1888355/197716089-909b9e2d-3d6a-4b7f-a61a-b7841d105648.png">


## Related

https://twitter.com/kylehickinson/status/1582471814843883535
