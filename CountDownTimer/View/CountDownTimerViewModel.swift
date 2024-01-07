//
//  CountDownTimerViewModel.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import Foundation

@MainActor
class CountdownTimerViewModel: ObservableObject {
    
    @Published var day: Int = 0
    @Published var hour: Int = 0
    @Published var minute: Int = 0
    @Published var second: Int = 0
    
    var endDate: Date
    
    var hasCountdownCompleted: Bool {
        Date() >= endDate
    }
    
    init(endDate: Date) {
        self.endDate =  endDate
        updateTimer()
    }
    
    func updateTimer() {
        let calendar = Calendar(identifier: .gregorian)
    
        // 現在時刻からendDateまでの時間差を計算
        let timeValue = calendar.dateComponents([.day, .hour, .minute, .second], from: Date(), to: endDate)
        
        if !hasCountdownCompleted,
           let day = timeValue.day,
           let hour = timeValue.hour,
           let minute = timeValue.minute,
           let second = timeValue.second {
            self.day = day
            self.hour = hour
            self.minute = minute
            self.second = second
        }
    }
}
