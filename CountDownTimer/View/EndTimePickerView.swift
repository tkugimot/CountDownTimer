//
//  EndTimePickerView.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import SwiftUI

struct EndTimePickerView: View {
    @EnvironmentObject var endTimePickerViewModel: EndTimePickerViewModel
    
    // This variable will dismiss the view
    @Environment(\.presentationMode) var presentationMode
    
    @State private var hoursSelection: Int = 0
    @State private var minutesSelection: Int = 0
    @State private var secondsSelection: Int = 0
    
    //設定可能な時間単位の数値
    var hours = [Int](0..<24)
    //設定可能な分単位の数値
    var minutes = [Int](0..<60)
    //設定可能な秒単位の数値
    var seconds = [Int](0..<60)
    
    var body: some View {
        
        Form {
            HStack {
                //時間単位のPicker
                Picker(selection: $hoursSelection, label: Text("hour")) {
                    ForEach(0 ..< self.hours.count, id: \.self) { index in
                        Text("\(self.hours[index])")
                            .tag(index)
                    }
                }
                //上下に回転するホイールスタイルを指定
                .pickerStyle(WheelPickerStyle())
                Text("h")
                    .font(.headline)

                //分単位のPicker
                Picker(selection: $minutesSelection, label: Text("minute")) {
                    ForEach(0 ..< self.minutes.count, id: \.self) { index in
                        Text("\(self.minutes[index])")
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .clipped()
                Text("m")
                    .font(.headline)

                //秒単位のPicker
                Picker(selection: $secondsSelection, label: Text("second")) {
                    ForEach(0 ..< self.seconds.count, id: \.self) { index in
                        Text("\(self.seconds[index])")
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .clipped()
                Text("s")
                    .font(.headline)
            }
            
            Button("Set", action: {
                print("Submit button tapped")
                endTimePickerViewModel.updateValues(hour: hoursSelection, min: minutesSelection, sec: secondsSelection)
                print(endTimePickerViewModel.calcEndTime())
                
                // This is how you go back to previous view
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    EndTimePickerView()
        .environmentObject(EndTimePickerViewModel())
}
