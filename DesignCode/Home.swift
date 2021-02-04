//
//  Home.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/4.
//

import SwiftUI

struct Home: View {
  @State var showProfile = false
  @State var viewState: CGSize = .zero

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        .edgesIgnoringSafeArea(.all)

      HomeView(showProfile: $showProfile)
        .padding(.top, 44)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20) // 左下，隱影記得要加在切圓角之後
        .offset(y: showProfile ? -450 : 0)
        .rotation3DEffect(.degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0)) // 3D 效果
        .scaleEffect(showProfile ? 0.9 : 1) // 縮放大小
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) // 添加動畫
        .edgesIgnoringSafeArea(.all)

      MenuView()
        .background(Color.black.opacity(0.001)) //＊＊＊技巧： 設為 0.1 會喪失互性，但 0.001 會保持互動性 ＊＊＊
        .offset(y: showProfile ? 0 : screen.height) // 1000 是往下推
        .offset(y: viewState.height)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
          showProfile.toggle()
        }
        .gesture(
          DragGesture().onChanged { value in
            viewState = value.translation
          }
          .onEnded{ value in
            if viewState.height > 50 { // 往下拉的時候自動關閉
              showProfile = false
            }
            viewState = .zero
          }
        )
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct AvatarView: View {
  @Binding var showProfile: Bool // Extract view 後要使用 binding，且不能給預設值，因為是動態的
  var body: some View {
    Button(action: { showProfile.toggle() }) {
      Image("Avatar")
        .renderingMode(.original)
        .resizable()
        .frame(width: 36, height: 36)
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: -5)
    }
  }
}

let screen = UIScreen.main.bounds
