//
//  SoundPlayerViewModel.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 01.06.2024.
//

import Foundation
import AVFoundation

class SoundPlayerViewModel: ObservableObject{
    private var audioPlayer: AVAudioPlayer?
    var soundParameters: SoundItem
    private var timer: Timer?
    private var duration: Int = 0
    
    
    @Published var currentTime: TimeInterval = 0
//    @Published var currentMinutes: Int = 0
//    @Published var currentSeconds: Int = 0
    @Published var isDragging = false

    
    init(soundParameters: SoundItem) {
        self.soundParameters = soundParameters
        do{
            let resourcePath = Bundle.main.url(forResource: self.soundParameters.tape, withExtension: "mp3")
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
//            self.currentMinutes = Int(player.currentTime / 60)
//            self.currentSeconds = Int(player.currentTime) % 60
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
    
}
