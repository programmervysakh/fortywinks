//
//  ContentView.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-21.
//

import SwiftUI

struct MainView: View {
    @State var screenSize: CGSize = .zero

    var body: some View {
        ZStack {
            Color(.white)
                .opacity(1)
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geometryReader in
                VStack(spacing: 0) {
                    HStack {
                        Text("Forty Winks")
                            .padding()
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                            .font(.title)
                            .foregroundColor(.orange)
                            .frame(alignment: .trailing)
                        Spacer()
                        Button(action: {
                            
                            
                        }) {
                            Image("Forty")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(20)
                                .shadow(radius: 1)
                        }
                    }
                    .offset(y: 0)
                    .frame(minWidth: 0, maxHeight: 100)
                    VStack {
                        MusicListView()
                            .offset(y: 0)
                            .frame(height: geometryReader.size.height - 100, alignment: .center)
                            .listRowSeparator(.hidden)
                            .overlay(
                                VStack {
                                    Spacer()
                                    Text("Made with ❤️")
                                        .fontDesign(.monospaced)
                                        .font(.custom("", size: 10))
                                        .fontWeight(.semibold)
                                        .background(.clear)
                                }
                            )
                            .frame(alignment: .center)
                    }
                    .padding(.bottom, 0)
                }
                .shadow(radius: 0.5)

                .padding(.top, 10)
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: 0)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
