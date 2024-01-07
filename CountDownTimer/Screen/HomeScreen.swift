//
//  HomeScreen.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var endTimePickerViewModel: EndTimePickerViewModel
    
    var body: some View {
        NavigationStack {
            if endTimePickerViewModel.isInitialized() {
                CountdownTimerView(endDate: endTimePickerViewModel.calcEndTime())
                    .padding()
            } else {
                InitialView()
            }
            
            NavigationLink(destination: EndTimePickerView()) {
                Text("Set Countdown Timer!")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(EndTimePickerViewModel())
}
