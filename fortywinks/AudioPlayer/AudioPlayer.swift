//
//  AudioPlayer.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-22.
//

import AVFoundation
import Foundation

struct AudioPlayer {
    var musicPlayer: AVAudioPlayer!
    let audioSession = AVAudioSession.sharedInstance()

    mutating func initializeAudio(musicUrl: URL) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            musicPlayer.prepareToPlay()
            playBack()
        } catch {
            print(error)
        }
    }

    func playBack() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback)
        } catch {
            print(error)
        }
    }
}
