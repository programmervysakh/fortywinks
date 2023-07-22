//
//  PlayMusic.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-21.
//

import Foundation
import AVFoundation

var musicPlayer: AVAudioPlayer!
func playSound(soundName : String){
    
    let musicUrl = Bundle.main.url(forResource: soundName, withExtension: "mp3")
    
    guard  musicUrl != nil else {
        return
    }
    
    do {
        musicPlayer = try AVAudioPlayer(contentsOf: musicUrl!)
        musicPlayer.prepareToPlay()
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSession.Category.playback)
        }
        catch {
            print(error)
        }
    }
    catch {
        print(error)
    }
}

func startSound() {
    musicPlayer.play()
    musicPlayer.numberOfLoops = -1
}

func stopSound() {
    musicPlayer.stop()
}

