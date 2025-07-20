//
//  UserSettingView.swift
//  Toki
//
//  Created by POS on 7/20/25.
//

import Foundation
import SwiftUI

struct UserSettingView: View {
    @AppStorage("ringMode") private var ringMode: RingMode = .sound
    @AppStorage("pushEnabled") private var pushEnabled: Bool = true
    @AppStorage("toastEnabled") private var toastEnabled: Bool = true

    var body: some View {
        Form {
            Picker("notice", selection: $ringMode) {
                ForEach(RingMode.allCases) { mode in
                    Text(mode.rawValue).tag(mode)
                }
            }
            .pickerStyle(.segmented)

            Toggle("푸시 알림 보내기", isOn: $pushEnabled)
            
            Toggle("토스트 알림 보내기", isOn: $toastEnabled)

            Button("ring() Test") {
                ring()
            }
            Button("pushNotice() Test - 4초뒤 푸시수신") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    pushNotice()
                }
            }
        }
    }
}

#Preview {
    UserSettingView()
}
