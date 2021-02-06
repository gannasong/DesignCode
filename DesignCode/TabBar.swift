//
//  TabBar.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/6.
//

import SwiftUI

struct TabBar: View {
  var body: some View {
    TabView {
      Home().tabItem {
        Image(systemName: "play.circle.fill")
        Text("Home")
      }
      ContentView().tabItem {
        Image(systemName: "rectangle.stack.fill")
        Text("Certificates")
      }
    }
    .edgesIgnoringSafeArea(.top)
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
//    TabBar().previewDevice("iPhone 8") // 使用 previewDevice 可以看指定的尺寸
    // 使用 Group 可以同時 preview 多裝置
  }
}
