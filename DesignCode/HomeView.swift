//
//  HomeView.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/4.
//

import SwiftUI

struct HomeView: View {
  @Binding var showProfile: Bool // 要背 di 的參數都要用 @binding
  @State var showUpdate = false

  var body: some View {
    VStack {
      HStack {
        Text("Watching")
          .font(.system(size: 28, weight: .bold))
          .modifier(CustomFontModifier(size: 28))

        Spacer()

        AvatarView(showProfile: $showProfile) // 傳入的 State 必須要加上 $ 符號

        Button(action: { showUpdate.toggle() }) {
          Image(systemName: "bell")
            .renderingMode(.original)
            .font(.system(size: 16, weight: .medium))
            .frame(width: 36, height: 36)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
        }
        .sheet(isPresented: $showUpdate) {
          UpdateList()
        }
      }
      .padding(.horizontal)
      .padding(.leading, 14)
      .padding(.top, 30)

      ScrollView(.horizontal, showsIndicators: false) {
        WatchRingsView()
          .padding(.horizontal, 30)
          .padding(.bottom, 30)
      }

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

struct WatchRingsView: View {
  var body: some View {
    HStack(spacing: 30) {
      HStack(spacing: 12.0) {
        RingView(color1: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), width: 44, height: 44, percent: 78, show: .constant(true))
        VStack(alignment: .leading, spacing: 4.0) {
          Text("6 minutes left")
            .bold()
            .modifier(FontModifier(style: .subheadline))
          Text("Watched 10 mins today")
            .modifier(FontModifier(style: .caption))
        }
        .modifier(FontModifier())
      }
      .padding(8)
      .background(Color.white)
      .cornerRadius(20)
      .modifier(ShadowModifier())
      
      HStack(spacing: 12.0) {
        RingView(color1: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), color2: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), width: 32, height: 32, percent: 54, show: .constant(true))
      }
      .padding(8)
      .background(Color.white)
      .cornerRadius(20)
      .modifier(ShadowModifier())
      
      HStack(spacing: 12.0) {
        RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), width: 32, height: 32, percent: 32, show: .constant(true))
      }
      .padding(8)
      .background(Color.white)
      .cornerRadius(20)
      .modifier(ShadowModifier())
    }
  }
}
