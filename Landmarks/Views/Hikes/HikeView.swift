//
//  HikeView.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 09/08/23.
//

import SwiftUI

struct HikeView: View {
    let hike: Hike
    @State private var showDetails = false
    var body: some View {
        VStack{
            HStack{
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    showDetails.toggle()
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetails ? 90: 0))
                        .padding()
                }
            }
            if showDetails {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]
    static var previews: some View {
        HikeView(hike: hike)
    }
}
