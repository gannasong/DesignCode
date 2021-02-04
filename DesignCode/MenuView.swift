//
//  MenuView.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/4.
//

import SwiftUI

struct MenuView: View {
  var body: some View {
    VStack {
      MenuRow()
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

struct MenuRow: View {
  var body: some View {
    HStack(spacing: 16) { // 設定 spacing 讓 Image 跟 Text 間距加大
      Image(systemName: "gear")
        .font(.system(size: 20, weight: .light))
        .imageScale(.large) // 圖案變大

      Text("Account")
        .font(.system(size: 20, weight: .bold, design: .default)) // design 就是下載的字體
    }
  }
}
