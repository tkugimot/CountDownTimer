//
//  CountDownTimerView.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/05.
//

import SwiftUI

struct CountdownTimerView: View {
    @ObservedObject var viewModel: CountdownTimerViewModel
    @State private var showAlert = false
    
    // viewを変更させるか否かを判定するためにtimerを動かす
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var hasCountdownCompleted: Bool {
        viewModel.hasCountdownCompleted
    }
    
    init(endDate: Date) {
        _viewModel = ObservedObject(wrappedValue: CountdownTimerViewModel(endDate: endDate))
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(spacing: 8) {
                    Text(String(format: "%02d", viewModel.hour))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.red)
                    Text("hour")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
                VStack(spacing: 8) {
                    colon
                    Spacer()
                        .frame(height: 15)
                }
                VStack(spacing: 8) {
                    Text(String(format: "%02d", viewModel.minute))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.red)
                    Text("min")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
                VStack(spacing: 8) {
                    colon
                    Spacer()
                        .frame(height: 15)
                }
                VStack(spacing: 8) {
                    Text(String(format: "%02d", viewModel.second))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.red)
                    Text("sec")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
            }
        }
        .onReceive(timer) { _ in
            if hasCountdownCompleted {
                timer.upstream.connect().cancel() // turn off timer
                showAlert = true
            } else {
                viewModel.updateTimer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Time's up"))
        }
    }
}

extension CountdownTimerView {
    private var colon: some View {
        Text(":")
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.red)
    }
}

#Preview {
    CountdownTimerView(endDate: Date())
}
