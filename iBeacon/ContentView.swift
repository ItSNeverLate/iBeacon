//
//  ContentView.swift
//  iBeacon
//
//  Created by Parsa on 10.10.23.
//

import SwiftUI
import CoreLocation
import CoreBluetooth

struct ContentView: View {
    @State private var locationManager = CLLocationManager()
    @State private var centralManager = CBCentralManager()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").onAppear{
                // Request always-on location access
                               locationManager.requestAlwaysAuthorization()
                
                // Request Bluetooth permission
                              centralManager = CBCentralManager(delegate: nil, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
                         
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
