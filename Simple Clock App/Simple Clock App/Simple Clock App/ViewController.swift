//
//  ViewController.swift
//  Simple Clock App
//
//  Created by user937495 on 6/16/24.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController {

    let clockLabel = UILabel()
    let datePicker = UIDatePicker()
    let startStopButton = UIButton(type: .system)
    let timerLabel = UILabel()
    
    var timer: Timer?
    var countdownTimer: Timer?
    var player: AVAudioPlayer?
    var countdownDuration: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLiveClock()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        // Setup clockLabel
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.font = UIFont.systemFont(ofSize: 24)
        clockLabel.textAlignment = .center
        view.addSubview(clockLabel)
        
        // Setup datePicker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .countDownTimer
        view.addSubview(datePicker)
        
        // Setup startStopButton
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.setTitle("Start Timer", for: .normal)
        startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .touchUpInside)
        view.addSubview(startStopButton)
        
        // Setup timerLabel
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont.systemFont(ofSize: 24)
        timerLabel.textAlignment = .center
        view.addSubview(timerLabel)
        
        // Add constraints
        NSLayoutConstraint.activate([
            clockLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            clockLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            datePicker.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startStopButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 20),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        print("UI setup complete")
    }

    func setupLiveClock() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }

    @objc func updateClock() {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        clockLabel.text = formatter.string(from: Date())
        
        // Change background based on AM/PM
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 6 && hour < 18 {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.black
        }
    }

    @objc func startStopButtonTapped() {
        if countdownTimer == nil {
            startTimer()
        } else {
            stopMusic()
        }
    }
    
    func startTimer() {
        countdownDuration = datePicker.countDownDuration
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startStopButton.setTitle("Stop Music", for: .normal)
    }

    @objc func updateTimer() {
        countdownDuration -= 1
        timerLabel.text = formatTime(countdownDuration)
        if countdownDuration <= 0 {
            countdownTimer?.invalidate()
            countdownTimer = nil
            playMusic()
        }
    }

    func formatTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func playMusic() {
        if let url = Bundle.main.url(forResource: "alarm-clock-short-6402", withExtension: "mp3") { // Alarm Sound
            player = try? AVAudioPlayer(contentsOf: url)
            player?.play()
        }
    }

    func stopMusic() {
        player?.stop()
        player = nil
        startStopButton.setTitle("Start Timer", for: .normal)
    }
}
