//
//  AudioPlayer.swift
//  fortywinks
//
//  Created by Vysakh Prasanth on 2023-07-22.
//

import AVFoundation
import Foundation
import MediaPlayer
import UIKit

struct AudioPlayer {
    var musicPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!

    let audioSession = AVAudioSession.sharedInstance()

    var nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
    var remoCommandCenter = MPRemoteCommandCenter.shared()

    mutating func initializeAudio(musicUrl: URL, soundName: String) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            musicPlayer.prepareToPlay()
            playBack(soundName: soundName)
        } catch {
            print(error)
        }
    }

    func playBack(soundName: String) {
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback)
            try! self.audioSession.setActive(true)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            updateNowPlayingInfo(trackName: "Forty Winks", artistName: soundName)
        } catch {
            print(error)
        }
    }

    func updateNowPlayingInfo(trackName: String, artistName: String) {
        nowPlayingInfoCenter.nowPlayingInfo = [MPMediaItemPropertyTitle: trackName, MPMediaItemPropertyArtist: artistName]

        remoCommandCenter.pauseCommand.isEnabled = true
        remoCommandCenter.seekForwardCommand.isEnabled = false
        remoCommandCenter.seekBackwardCommand.isEnabled = false
        remoCommandCenter.previousTrackCommand.isEnabled = false
        remoCommandCenter.nextTrackCommand.isEnabled = false
        remoCommandCenter.togglePlayPauseCommand.isEnabled = true
    }
}
