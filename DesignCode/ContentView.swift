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

      CardView()
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
    }.frame(width: 300, height: 220)
    .background(Color.blue)
    .cornerRadius(20)
    .shadow(radius: 20)
    .offset(x: 0, y: -20)
  }
}
