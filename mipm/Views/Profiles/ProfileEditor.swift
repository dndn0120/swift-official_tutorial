//
//  ProfileEditor.swift
//  mipm
//
//  Created by 강진욱 on 2023/03/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("이름").bold()
                Divider()
                TextField("이름", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("알림").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("계절").bold()
                
                Picker("계절", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("목표").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
