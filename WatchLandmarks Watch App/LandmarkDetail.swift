//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Jonas Cerqueira da Silva Junior on 24/08/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                Divider()
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                Text(landmark.state)
                    .font(.caption)
                Divider()
                MapView(coordinates: landmark.locationCoordinates)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandmarkDetail( landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Ultra (49mm)")
                .previewDisplayName("Ultra")
            
            LandmarkDetail( landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 8 (45mm)")
                .previewDisplayName("45mm")
            
            LandmarkDetail( landmark: modelData.landmarks[2])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 8 (41mm)")
                .previewDisplayName("41mm")
        }
        
    }
}
