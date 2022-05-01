//
//  ContentView.swift
//  Orientation
//
//  Created by Ricardo Venieris on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var deviceOrientation = UIDevice.current.orientation.text

    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Device Orientation").font(.largeTitle).fontWeight(.bold).underline()
                Text(deviceOrientation).font(.title)

                Spacer()
                
                Text("Screen Orientation").font(.largeTitle).fontWeight(.bold).underline()
                Text(UIScreen.orientation).font(.title)
                
                Spacer()
            }
            
            Text(UIDevice.current.model)
            Text(UIDevice.current.name)
            Text("\(UIDevice.current.systemName) - \(UIDevice.current.systemVersion)")

            Spacer()

            Text(UIDevice.current.identifierForVendor?.uuidString ?? "xxx")

            Spacer()
        }.onRotate {_ in
            deviceOrientation = UIDevice.current.orientation.text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
