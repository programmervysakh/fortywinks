//
//  PlayStopButton.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-21.
//

import SwiftUI

struct PlayStopButton: View {
    
    @State private var buttonTag: Int = 0
    @State private var imageString: String = "Play"
    @State private var musicList = MusicList()
    
    var body: some View {
        
        ZStack{
            HStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    playPressed()
                    
                }) {
                    Image(imageString)
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .trailing)
                }
                .padding(20)
                .padding(.top,10)
            }
        }
        
    }
    func playPressed(){
        if buttonTag == 0 {
            playSound(soundName: "Tranquility")
            startSound()
            buttonTag = 1
            imageString = "Stop"
        } else {
            stopSound()
            buttonTag = 0
            imageString = "Play"
        }
    }
    
    struct PlayStopButton_Previews: PreviewProvider {
        static var previews: some View {
            PlayStopButton()
        }
    }
}
