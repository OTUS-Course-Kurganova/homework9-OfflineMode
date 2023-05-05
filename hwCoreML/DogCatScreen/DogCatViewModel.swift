//
//  DogCatViewModel.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import SwiftUI

final class DogCatViewModel: ObservableObject {
    @Published var dogCatData: [DogCatData] = [
        .init(id: "0", name: "Cобака", imageName: "cat_or_dog_1"),
        .init(id: "1", name: "Кошка", imageName: "cat_or_dog_2")
    ]

    struct DogCatData: Identifiable {
        let id: String
        let name: String
        let imageName: String
    }
}
