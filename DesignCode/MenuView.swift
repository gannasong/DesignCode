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
        Text("Miguel - 28% complete")
          .font(.caption)

        Color.white // 單純使用 Color.white 就可以完成狀態條
          .frame(width: 38, height: 6)
          .cornerRadius(3)
          .frame(width: 130, height: 6, alignment: .leading)
          .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
          .cornerRadius(3)
          .padding()
          .frame(width: 150, height: 24)
          .background(Color.black.opacity(0.1))
          .cornerRadius(12)

        MenuRow(title: "Account", icon: "gear")
        MenuRow(title: "Billing", icon: "creditcard")
        MenuRow(title: "Sign out", icon: "person.crop.circle")
      }
      .frame(maxWidth: .infinity) // 這不是寬度，是把最大寬度設為無窮大，這樣就會延伸到左右兩邊
      .frame(height: 300) // 常規寬高設定不能與 maxWidth 一起
      .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .top, endPoint: .bottom))
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20) // 增加自訂義隱影，必須在切圓角後再添加，否則隱影會被切掉
      .padding(.horizontal, 30) // 橫向加入 padding
      .overlay(
        Image("Avatar")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 60, height: 60)
          .clipShape(Circle())
          .offset(y: -150)
          .shadow(radius: 10)
      )
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
        .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))

      Text(title)
        .font(.system(size: 20, weight: .bold, design: .default)) // design 就是下載的字體
        .frame(width: 120, alignment: .leading)
    }
  }
}
