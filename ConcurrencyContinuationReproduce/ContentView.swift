//
//  ContentView.swift
//  ConcurrencyContinuationReproduce
//
//  Created by Muukii on 2022/10/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    BookContiunation()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct BookContiunation: View {

  @State var text: String = ""

  var body: some View {

    Button("Run") {

      Task { @MainActor () -> Void in
        await withCheckedContinuation { c in
          
          let thread = Thread.current.description
          
          if Thread.isMainThread == false {
            DispatchQueue.main.async {
              text = thread
            }
          } else {
            text = thread
          }
          
          c.resume()
        }
      }

    }

    Text(text)

  }

}
