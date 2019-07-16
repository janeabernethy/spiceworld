//
//  ContentView.swift
//  Prototype2
//
//  Created by Jane Abernethy on 7/16/19.
//  Copyright © 2019 Jane Abernethy. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40.0) {
                HStack(spacing: -30.0) {
                    SpiceView(name: "Scary", rotation: -30, offsetY: 20)
                    SpiceView(name: "Baby", rotation: -15, offsetY: 0)
                    
                    SpiceView(name: "Posh", rotation: 0, offsetY: -20)
                    
                    SpiceView(name: "Ginger", rotation: 15, offsetY: 0)
                    SpiceView(name: "Sporty", rotation: 30, offsetY: 20)
                }
                Lyrics()
                RoundedView()
                Spacer() .navigationBarTitle("Spice Girls")
                
            }
            .padding(16.0)
           
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
#endif

struct SpiceView : View {
    var name: String
    var rotation: Double
    var offsetY: CGFloat
    @State var translation = CGSize(width: 0, height: 0)
    
    var body: some View {
        return Image(name)
            .cornerRadius(8)
            .shadow(radius: 4, x: 4, y: 4)
            .rotationEffect(Angle(degrees: rotation))
            .offset(CGSize(width: translation.width, height: offsetY + translation.height))
            .animation(.basic(duration: 0.2, curve: .easeInOut))
            .gesture(DragGesture().onChanged({ (value) in
                self.translation = value.translation
            }).onEnded({ (value) in
                self.translation = CGSize(width: 0, height: 0)
            }))
    }
}

struct Lyrics : View {
    var body: some View {
        return Text("I'll tell you what I want, what I really, really, want.\n So tell me what you want, what you really really want\n I'll tell you what I want, what I really, really, want.\n So tell me what you want, what you really really want")
            .font(.callout)
            .fontWeight(.light)
            .color(.purple)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
    }
}

struct RoundedView : View {
    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 60)
                .foregroundColor(.yellow)
                Text("SPICE UP YOUR LIFE")
                    .font(.headline)
                    .fontWeight(.bold)
        }
    }
}
