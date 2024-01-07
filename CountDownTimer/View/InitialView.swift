//
//  InitialView.swift
//  CountDownTimer
//
//  Created by Toshimitsu Kugimoto on 2024/01/07.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        VStack {
            Image(systemName: "hourglass")
                .font(.system(size: 50))
                .foregroundColor(.blue)
                .padding()
        }
        .padding()
    }
}

#Preview {
    InitialView()
}
