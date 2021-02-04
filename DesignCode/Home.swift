//
//  Home.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/4.
//

import SwiftUI

struct Home: View {
  @State var showProfile = false

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        .edgesIgnoringSafeArea(.all)

      VStack {
        HStack {
          Text("Watching")
            .font(.system(size: 28, weight: .bold))

          Spacer()

          Button(action: { showProfile.toggle() }) {
            Image("Avatar")
              .renderingMode(.original)
              .resizable()
              .frame(width: 36, height: 36)
              .clipShape(Circle())
              .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: -5)
          }
        }
        .padding(.horizontal)
        .padding(.top, 30)

        Spacer()
      }
      .padding(.top, 44)
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20) // 左下，隱影記得要加在切圓角之後
      .offset(y: showProfile ? -450 : 0)
      .rotation3DEffect(.degrees(showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0)) // 3D 效果
      .scaleEffect(showProfile ? 0.9 : 1) // 縮放大小
      .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) // 添加動畫
      .edgesIgnoringSafeArea(.all)

      MenuView()
        .offset(y: showProfile ? 0 : 600)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
