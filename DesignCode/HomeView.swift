//
//  HomeView.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/4.
//

import SwiftUI

struct HomeView: View {
  @Binding var showProfile: Bool // 要背 di 的參數都要用 @binding

  var body: some View {
    VStack {
      HStack {
        Text("Watching")
          .font(.system(size: 28, weight: .bold))

        Spacer()

        AvatarView(showProfile: $showProfile) // 傳入的 State 必須要加上 $ 符號
      }
      .padding(.horizontal)
      .padding(.leading, 14)
      .padding(.top, 30)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 30) { // item 之間間隔
          ForEach(0 ..< 5) { item in
            SectionView()
          }
        }
        .padding(30)
        .padding(.bottom, 30)
      }

      Spacer()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(showProfile: .constant(false)) // 如果有 di 的參數，不需給假資料，prview 可給預設參數
  }
}

struct SectionView: View {
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text("Prototype designs in SwiftUI")
          .font(.system(size: 24, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundColor(.white)
        Spacer()
        Image("Logo1")
      }

      Text("18 Sections".uppercased()) // 把字變大寫
        .frame(maxWidth: .infinity, alignment: .leading)

      Image("Card1")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: 275, height: 275)
    .background(Color("card1"))
    .cornerRadius(30)
    .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
  }
}
