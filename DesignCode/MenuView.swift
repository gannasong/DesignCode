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
      MenuRow(title: "Account", icon: "gear")
      MenuRow(title: "Billing", icon: "creditcard")
      MenuRow(title: "Sign out", icon: "person.crop.circle")
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

struct MenuRow: View {
  var title: String // 不建議使用空字串當 default value
  var icon: String

  var body: some View {
    HStack(spacing: 16) { // 設定 spacing 讓 Image 跟 Text 間距加大
      Image(systemName: icon)
        .font(.system(size: 20, weight: .light))
        .imageScale(.large) // 圖案變大
        .frame(width: 32, height: 32)

      Text(title)
        .font(.system(size: 20, weight: .bold, design: .default)) // design 就是下載的字體
        .frame(width: 120, alignment: .leading)
    }
  }
}
