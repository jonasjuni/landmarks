//
//  PageView.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 21/08/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
            
            HStack {
                Button {
                    currentPage = currentPage - 1 < 0 ? 2 : currentPage - 1
                } label: {
                    Label("Previous", systemImage: "chevron.backward")
                        .labelStyle(.iconOnly)
                }
                
                Button {
                    currentPage = (currentPage + 1) % 3
                } label: {
                    Label("Next", systemImage: "chevron.forward")
                        .labelStyle(.iconOnly)
                }
            }
            .padding()
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
