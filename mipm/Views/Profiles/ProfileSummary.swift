//
//  ProfileSummary.swift
//  mipm
//
//  Created by 강진욱 on 2023/03/25.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("알림: \(profile.prefersNotifications ? "On": "Off" )")
                Text("계절: \(profile.seasonalPhoto.rawValue)")
                Text("목표일: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("뱃지 달성")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "첫 하이킹")
                            HikeBadge(name: "지구의 날")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "10번의 하이킹")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("최근 하이킹")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
