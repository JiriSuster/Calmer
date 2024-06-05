//
//  SoundPlayerViewModel.swift
//  Calmer
//
//  Created by David Krčmář on 01.06.2024.
//

import Foundation
import AVFoundation

class SoundPlayerViewModel: ObservableObject{
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    private var duration: Int = 0
    
    
    @Published var currentTime: TimeInterval = 0
    @Published var isDragging = false
    @Published var isRepeater = false
    
    //selected sound
    var currentIndex: Int
    var soundItems: [SoundItem]
    

    
    init(currentIndex: Int, soundItems: [SoundItem]) {
        self.currentIndex = currentIndex
        self.soundItems = soundItems
        do{
            let resourcePath = Bundle.main.url(forResource: self.soundItems[currentIndex].tape, withExtension: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
            self.duration = Int(audioPlayer?.duration ?? 0)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func playSound(){
            audioPlayer?.play()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                self?.updateCurrentTime()
                self?.updateVolume()
            }
    }
    
    private func updateCurrentTime() {
            guard let player = audioPlayer, !isDragging else { return }
            self.currentTime = player.currentTime
            checkSoundEnd()
        }
    
    func pauseSound() {
        audioPlayer?.pause()
    }
    
    func getDuration() -> Int {
        return self.duration
    }
    
    func getFormatedCurrentTime() -> String{
        let currentMinutes = Int(self.currentTime / 60)
        let currentSeconds = Int(self.currentTime) % 60
        return "\(String(format: "%02d",currentMinutes)):\(String(format: "%02d",currentSeconds))"
    }

    func getFormatedDuration() -> String {
        let minutes = self.duration / 60
        let seconds = self.duration % 60
        return "\(String(format: "%02d",minutes)):\(String(format: "%02d",seconds))"
    }
    
    func isMusicPlaying() -> Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    
    private func updateVolume() {
        guard let player = audioPlayer else { return }
        let currentVolume = AVAudioSession.sharedInstance().outputVolume
        player.volume = currentVolume
    }
    
    
    func setCurrentTime(_ time: TimeInterval) {
        audioPlayer?.currentTime = time
        updateCurrentTime()
    }
    
    func getCurrentItem() -> SoundItem{
        return self.soundItems[self.currentIndex]
    }
    
    func setNextSound() {
        if self.soundItems.count - 1 == self.currentIndex{
            self.currentIndex = 0
        }else{
            self.currentIndex += 1
        }
        prepareNewSound()
    }
    
    func setPrevSound() {
        if self.currentIndex == 0{
            self.currentIndex = self.soundItems.count - 1
        }else{
            self.currentIndex -= 1
        }
        prepareNewSound()
    }
    
    func setRandomSound() {
        var randSoundIndex = Int.random(in: 0...(self.soundItems.count - 1))
        while self.currentIndex == randSoundIndex {
            randSoundIndex = Int.random(in: 0...(self.soundItems.count - 1))
        }
        self.currentIndex = randSoundIndex
        prepareNewSound()
    }
    
    private func prepareNewSound(){
        do{
            let resourcePath = Bundle.main.url(forResource: self.soundItems[currentIndex].tape, withExtension: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
            self.duration = Int(audioPlayer?.duration ?? 0)
            audioPlayer?.play()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func checkSoundEnd() {
        if Int(self.currentTime) == self.duration {
            if self.isRepeater {
                guard let player = audioPlayer else { return }
                player.currentTime = 0
                player.play()
            }else{
                setNextSound()
            }
            
        }
    }
    
}
