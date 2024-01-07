//
//  EndTimePickerViewModel.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import Foundation

class EndTimePickerViewModel: ObservableObject {
    //Pickerで設定した"時間"を格納する変数
    @Published var hourSelection: Int = 0
    //Pickerで設定した"分"を格納する変数
    @Published var minSelection: Int = 0
    //Pickerで設定した"秒"を格納する変数
    @Published var secSelection: Int = 0
    
    func isInitialized() -> Bool {
        hourSelection != 0 || minSelection != 0 || secSelection != 0
    }
    
    func calcEndTime() -> Date {
        // 現在の日時を取得
        let currentDate = Date()
        
        // Calendarを取得
        let calendar = Calendar.current
        
        // 指定した時間を現在時刻に加算
        if let newDate = calendar.date(byAdding: .hour, value: hourSelection, to: currentDate),
           let newDate2 = calendar.date(byAdding: .minute, value: minSelection, to: newDate),
           let newDate3 = calendar.date(byAdding: .second, value: secSelection, to: newDate2) {
            return newDate3
        }
        
        return currentDate
    }
    
    func updateValues(hour: Int, min: Int, sec: Int) {
        self.hourSelection = hour
        self.minSelection = min
        self.secSelection = sec
    }
}
