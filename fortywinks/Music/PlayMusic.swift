//
//  PlayMusic.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-21.
//

import Foundation

var audioPlayer: AudioPlayer = AudioPlayer()

func playSound(soundName: String) {
    let musicUrl = Bundle.main.url(forResource: soundName, withExtension: "mp3")
    guard musicUrl != nil else {
        return
    }
    audioPlayer.initializeAudio(musicUrl: musicUrl!, soundName: soundName)
}

func startSound() {
    audioPlayer.musicPlayer.play()
    audioPlayer.musicPlayer.numberOfLoops = -1
}

func stopSound() {
    audioPlayer.musicPlayer.stop()
}
