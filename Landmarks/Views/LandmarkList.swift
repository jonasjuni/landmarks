//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 01/08/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(landmarks) {
                    landmark in NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 14 Pro Max", "iPhone SE (3rd generation)", "iPad Air (5th generation)"], id: \.self) {
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
        }
    }
}
