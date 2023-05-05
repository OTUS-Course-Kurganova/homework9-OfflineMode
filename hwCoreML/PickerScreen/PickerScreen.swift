//
//  PickerScreen.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import SwiftUI
import PhotosUI

struct PickerScreen: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showingSheet = false

    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Text("Загрузите фото кошки или собаки \n для идентификации")
                .foregroundColor(Color.teal)
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                }
            }
        }

        if let img = selectedImage {
            Image(uiImage: img)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        RecognitionScreen(uiImage: $selectedImage, classifier: ImageClassifier())
        .padding(.top, 5)
    }
}

struct PickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickerScreen()
    }
}
