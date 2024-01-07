//
//  ContentView.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import SwiftUI

struct ContentView: View {
    let endTimePickerViewModel: EndTimePickerViewModel = EndTimePickerViewModel()
    
    var body: some View {
        VStack {
            HomeScreen()
        }
        .padding()
        .environmentObject(endTimePickerViewModel)
    }
}

#Preview {
    ContentView()
}
