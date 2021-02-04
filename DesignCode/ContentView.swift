//
//  ContentView.swift
//  DesignCode
//
//  Created by SUNG HAO LIN on 2021/2/2.
//

import SwiftUI

struct ContentView: View {
  @State var show = false
  @State var viewState: CGSize = .zero
  @State var showCard = false
  private var firstBackCardWidth: CGFloat =  300 // 因為這版編譯器型別推倒有問題，所以改成這樣

  var body: some View {
    ZStack {
      TitleView()
        .blur(radius: show ? 20 : 0)
        .opacity(showCard ? 0.4 : 1) // 設定透明度
        .offset(y: showCard ? -200 : 0) // 點擊 CardView 時 TitleView 位移
        .animation(
          Animation
            .default
            .delay(0.1) // 點擊之後，TitleView 延遲動畫
        )

      BackCardView()
        .frame(width: showCard ? firstBackCardWidth : 340, height: 220)
        .background(show ? Color("card3") : Color("card4"))
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -400 : -40) // offset 調整位置
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -180 : 0)
        .scaleEffect(showCard ? 1 : 0.9) // 恢復正常大小
        .rotationEffect(.degrees(show ? 0 : 10))
        .rotationEffect(.degrees(showCard ? -10 : 0))
        .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.5))

      BackCardView()
        .frame(width: 340, height: 220)
        .background(show ? Color("card4") : Color("card3"))
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -200 : -20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -140 : 0)
        .scaleEffect(showCard ? 1 : 0.95) // 調整 backcardview 大小比例(這邊採用逐漸縮小)
        .rotationEffect(.degrees(show ? 0 : 5)) // 旋轉角度
        .rotationEffect(.degrees(showCard ? -5 : 0)) // 點擊之後角度轉正
        .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0)) // 調整 3D 角度
        .blendMode(.hardLight) // 混合模式
        .animation(.easeInOut(duration: 0.3)) // 設置動畫

      CardView()
//        .frame(width: showCard ? 375 : 340, height: 220)
        .frame(width: 375, height: 220) // 需要修改高度，但是這邊編譯器會壞掉
        .background(Color.black)
//        .cornerRadius(20)
        .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(radius: 20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -100 : 0)
        .blendMode(.hardLight)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) // release drag animation, response 回來速度，數字越小越快，dampingFraction 反彈效果，數字越小反彈越大
        .onTapGesture {
          showCard.toggle()
        }
        .gesture(
          DragGesture().onChanged { value in // 拖曳手勢
            viewState = value.translation
            show = true
          }
          .onEnded { value in // restore position
            viewState = .zero
            show = false
          }
        )

      BottomCardView()
        .offset(x: 0, y: showCard ? 400 : 1000)
        .blur(radius: show ? 20 : 0)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)) // bottom card view 推出來的速度
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
  }
}

struct BackCardView: View {
  var body: some View {
    VStack {
      Spacer()
    }
  }
}

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Certificates")
          .font(.largeTitle)
          .fontWeight(.bold)
        Spacer()
      }
      .padding()
      Image("Background1")
      Spacer()
    }
  }
}

struct BottomCardView: View {
  var body: some View {
    VStack(spacing: 20) {
      Rectangle()
        .frame(width: 40, height: 5)
        .cornerRadius(3)
        .opacity(0.1)
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      Spacer()
    }
    .padding(.top, 8)
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(radius: 20)
  }
}
