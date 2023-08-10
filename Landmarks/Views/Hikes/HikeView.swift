//
//  HikeView.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 09/08/23.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

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
                    withAnimation {
                        showDetails.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetails ? 90: 0))
                        .scaleEffect(showDetails ? 1.5 : 1)
                        .padding()
                }
            }
            if showDetails {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]
    static var previews: some View {
        VStack {
            HikeView(hike: hike)
                .padding()
            Spacer()
        }
        
    }
}
