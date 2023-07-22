//
//  MusicList.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-05-21.
//

import SwiftUI

struct MusicList: View {
    @State public var sounds = [
        "Tranquility",
        "Deep Meditation",
        "In The Light",
        "Light Rain",
        "Rain and thunder"
    ]
    @State private var buttonTag: Int = 0
    @State private var imageString: String = "Play"
    @State public var soundName = ""

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                List($sounds, id: \.self) { sounds in
                    ZStack {
                        HStack {
                            Text(verbatim: sounds.wrappedValue)
                                .fontWeight(.bold)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()

                            Button(action: {
                                soundName = sounds.wrappedValue
                                playPressed()

                            }) {
                                Image(imageString)
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .trailing)
                            }
                            .padding(20)
                            .padding(.top, 10)
                        }
                    }
                }
            }
        }
    }

    func playPressed() {
        if buttonTag == 0 {
            playSound(soundName: soundName)
            startSound()
            buttonTag = 1
            imageString = "Stop"
        } else {
            stopSound()
            buttonTag = 0
            imageString = "Play"
        }
    }
}

struct MusicList_Previews: PreviewProvider {
    static var previews: some View {
        MusicList()
    }
}
