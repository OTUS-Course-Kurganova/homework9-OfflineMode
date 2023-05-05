//
//  ContentView.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DogCatScreen()
                .environmentObject(DogCatViewModel())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
