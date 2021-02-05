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
        HStack(spacing: 20) { // item 之間間隔
          ForEach(sectionData) { item in
            GeometryReader { geometry in // 卡片疊加效果
              SectionView(section: item)
                .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX - 30) / -20),
                                  axis: (x: 0, y: 10, z: 0)) // 酷炫選轉效果，神奇角度
            }
            .frame(width: 275, height: 275)
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
  var section: Section

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text(section.title)
          .font(.system(size: 24, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundColor(.white)
        Spacer()
        Image(section.logo)
      }

      Text(section.text.uppercased()) // 把字變大寫
        .frame(maxWidth: .infinity, alignment: .leading)

      section.image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: 275, height: 275)
    .background(section.color)
    .cornerRadius(30)
    .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
  }
}

struct Section: Identifiable {
  var id = UUID()
  var title: String
  var text: String
  var logo: String
  var image: Image
  var color: Color
}

let sectionData = [
  Section(title: "Prototype designs in SwiftUI",
          text: "18 Sections",
          logo: "logo1",
          image: Image("Card1"),
          color: Color("card1")),
  Section(title: "Build a SwiftUI App",
          text: "20 Sections",
          logo: "logo1",
          image: Image("Card2"),
          color: Color("card2")),
  Section(title: "SwiftUI Advanced",
          text: "20 Sections",
          logo: "logo1",
          image: Image("Card3"),
          color: Color("card3"))
]
