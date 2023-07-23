//
//  MusicList.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-05-21.
//

import SwiftUI

struct MusicList: View {
    @State public var sounds = [Musics(name: "Tranquility"), Musics(name: "Deep Meditation"), Musics(name: "In The Light"), Musics(name: "Light Rain"), Musics(name: "Rain and thunder"),
    ]
    @State var selectedIDs: UUID?

    @State private var isPlaying: Bool = false
    @State public var soundName = ""
    @State private var selection: String?

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                List($sounds) { $sounds in
                    HStack {
                        Text(verbatim: sounds.name)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            soundName = sounds.name
                            selectedIDs = sounds.id
                            playPressed()

                        }) {
                            Image(selectedIDs == sounds.id && isPlaying ? "Stop" : "Play")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .trailing)
                        }
                        .padding(20)
                    }
                }
            }
        }
    }

    func playPressed() {
        if isPlaying == false {
            playSound(soundName: soundName)
            startSound()
            isPlaying = true
        } else {
            stopSound()
            isPlaying = false
        }
    }
}

struct MusicList_Previews: PreviewProvider {
    static var previews: some View {
        MusicList()
    }
}
