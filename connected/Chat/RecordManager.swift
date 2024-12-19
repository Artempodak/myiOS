//
//  RecordManager.swift
//  connected
//
//  Created by Artem Podorozhniy on 19.12.2024.
//

import AVFoundation

//class RecordManager {
//    
//    private var recorder: AVAudioRecorder?
//    private var timer: Timer?
//    
//    
//    init(){
//        setUpRecorder()
//    }
//    
//    
//    private func setUpRecorder(){
//        
//        let audioFileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("recording.m4a")
//        
//        let settings = [
//            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
//        ]
//        
//        do {
//            recorder = try AVAudioRecorder(url: audioFileName, settings: settings)
//            recorder?.isMeteringEnabled = true
//            recorder?.prepareToRecord()
//            
//            recorder?.record()
//            recorder?.stop()
//        } catch {
//            print("recorder Init error\(error)")
//            
//        }
//        
//    }
//    
//    func startRecording(){
//        recorder?.prepareToRecord()
//        recorder?.record()
//        startMonitoring()
//        stopMonitoring()
//    }
//    
//    
//    func stopRecording(){
//        recorder?.stop()
//    }
//    
//    private func startMonitoring(){
//        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateVolume), userInfo: nil, repeats: true)
//    }
//    
//    private func stopMonitoring(){
//        timer?.invalidate()
//        timer = nil
//    }
//    
//    
//    @objc
//    private func updateVolume(){
//        recorder?.updateMeters()
//        let volume = recorder?.averagePower(forChannel: 0) ?? 0
//        print(volume)
//    }
//}
import AVFoundation

class RecordManager: ObservableObject {
    
    private var recorder: AVAudioRecorder?
    private var timer: Timer?
    
    @Published var volume: Float = 0.0
    @Published var audioURL: URL?
    
    init() {
        setUpRecorder()
    }
    
    private func setUpRecorder() {
        let audioFileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("recording.m4a")
        
        let settings: [String: Any] = [
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVNumberOfChannelsKey: 1,
            AVSampleRateKey: 44100.0
        ]
        
        do {
            recorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            recorder?.isMeteringEnabled = true
            recorder?.prepareToRecord()
        } catch {
            print("Recorder setup failed: \(error)")
        }
    }
    
    func startRecording() {
        recorder?.record()
        startMonitoring()
    }
    
    func stopRecording() {
        recorder?.stop()
        stopMonitoring()
        audioURL = recorder?.url // Сохраняем URL аудиофайла
    }
    
    private func startMonitoring() {
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateVolume), userInfo: nil, repeats: true)
    }
    
    private func stopMonitoring() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateVolume() {
        recorder?.updateMeters()
        let avgPower = recorder?.averagePower(forChannel: 0) ?? -160.0
        volume = pow(10, avgPower / 20)
    }
}
