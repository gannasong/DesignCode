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
      .padding(.top, 30)

      Spacer()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(showProfile: .constant(false)) // 如果有 di 的參數，不需給假資料，prview 可給預設參數
  }
}
