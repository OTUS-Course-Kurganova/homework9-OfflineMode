//
//  DogCatScreen.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import SwiftUI

struct DogCatScreen: View {
    @EnvironmentObject var viewModel: DogCatViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dogCatData) { dogCat in
                    CollectionView(dogCatData: dogCat)
                }
            }
            .navigationBarTitle("Классификация")
        }
        PickerScreen()
            .padding(.top, 10)
    }
}

struct CollectionView: View {
    let dogCatData: DogCatViewModel.DogCatData

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<1) { _ in
                    Image(dogCatData.imageName)
                        .resizable()
                        .frame(width: 200, height: 120)
                }.padding(.bottom, 5)
            }
            HStack {
                Spacer()
                Text(dogCatData.name)
                Spacer()
            }
        }
    }
}

struct DogCatScreen_Previews: PreviewProvider {
    static var previews: some View {
        DogCatScreen()
    }
}
