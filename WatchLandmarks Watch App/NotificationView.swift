//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Jonas Cerqueira da Silva Junior on 24/08/23.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            Divider()
            Text(message ?? "You are within 5 miles of your favorite landmark.")
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        let landmark = ModelData().landmarks[0]
        return Group {
            NotificationView()
            NotificationView(
                title: landmark.name,
                message: "You are within 5 miles of \(landmark.name).",
                landmark: landmark
            )
        }
    }
}
