//
//  ContentView.swift
//  ConcurrencyContinuationReproduce
//
//  Created by Muukii on 2022/10/20.
//

import SwiftUI
import UIKit

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
        await withCheckedContinuation { @MainActor c in
          
          UIView()
          
          c.resume()
        }
      }
      
    }
    
    Text(text)
    
  }
  
}
