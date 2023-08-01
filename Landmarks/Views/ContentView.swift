//
//  ContentView.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 16/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack {
                        Text("Joshua Tree National Park")
                        Spacer()
                        Text("California")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("About Turtle Rock")
                        .font(.title2)
                    Text("""
                        Turtle Rocks is a picturesque coastal formation located along the pristine shores of an undisclosed location. This natural wonder derives its name from the numerous rock formations that resemble the shells of ancient sea turtles. These rocks have been shaped over centuries by the relentless crashing waves, creating a stunning spectacle that attracts visitors from far and wide.
                        
                        The rocks are characterized by their unique shapes and sizes, some standing tall and grand, while others appear smaller and more delicate. Covered in a vibrant tapestry of moss, lichens, and seaweed, the rocks add a splash of color to the rugged coastline. During low tide, visitors can explore the rocky terrain, revealing hidden tidal pools teeming with marine life and fascinating creatures.
                        
                        The surroundings of Turtle Rocks are equally captivating. Cliffs and verdant hills provide a backdrop of natural beauty, while the rhythmic sound of waves crashing against the rocks creates a soothing melody. The area is also home to a diverse ecosystem, with seabirds soaring overhead and marine creatures thriving in the crystal-clear waters.
                        
                        Turtle Rocks offers a peaceful retreat for nature enthusiasts, hikers, and photographers alike. Visitors can embark on scenic hikes along coastal trails, capturing breathtaking vistas and enjoying the fresh sea breeze. The ethereal beauty and tranquility of Turtle Rocks make it a perfect destination for those seeking solace and a deep connection with nature.
                        
                        Preserving the ecological integrity of Turtle Rocks is of utmost importance, and efforts are made to ensure sustainable tourism practices. Visitors are encouraged to respect the natural environment, take only photographs, and leave no trace behind, allowing future generations to marvel at the beauty of this coastal gem.
                        """)
                }
                .padding()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
