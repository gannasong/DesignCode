//
//  ContentView.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/2.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      BackCardView()
        .background(Color("card4"))
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: -40) // offset 調整位置
        .scaleEffect(0.9)
        .rotationEffect(.degrees(10))
        .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)

      BackCardView()
        .background(Color("card3"))
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: -20)
        .scaleEffect(0.95) // 調整 backcardview 大小比例(這邊採用逐漸縮小)
        .rotationEffect(.degrees(5)) // 旋轉角度
        .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0.0, z: 0.0)) // 調整 3D 角度
        .blendMode(.hardLight) // 混合模式

      CardView()
        .blendMode(.hardLight)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct CardView: View {
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("UI Design")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
          Text("Certificates")
            .foregroundColor(Color("accent"))
        }
        Spacer()
        Image("Logo1")
      }
      .padding()
      Spacer()
      Image("Card1")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 110, alignment: .top)
    }
    .frame(width: 340.0, height: 220.0)
    .background(Color.black)
    .cornerRadius(20)
    .shadow(radius: 20)
  }
}

struct BackCardView: View {
  var body: some View {
    VStack {
      Spacer()
    }.frame(width: 340, height: 220)
  }
}
