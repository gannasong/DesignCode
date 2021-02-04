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
      Spacer()

      VStack(spacing: 16) {
        MenuRow(title: "Account", icon: "gear")
        MenuRow(title: "Billing", icon: "creditcard")
        MenuRow(title: "Sign out", icon: "person.crop.circle")
      }
      .frame(maxWidth: .infinity) // 這不是寬度，是把最大寬度設為無窮大，這樣就會延伸到左右兩邊
      .frame(height: 300) // 常規寬高設定不能與 maxWidth 一起
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(radius: 30) // 增加隱影，必須在切圓角後再添加，否則隱影會被切掉
      .padding(.horizontal, 30) // 橫向加入 padding
    }
    .padding(.bottom, 30) // 在外層 vstack 底部添加 padding
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
