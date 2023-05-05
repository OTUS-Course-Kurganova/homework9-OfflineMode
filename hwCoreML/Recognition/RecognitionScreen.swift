//
//  RecognitionScreen.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import SwiftUI

struct RecognitionScreen: View {
    @Binding var uiImage: UIImage?
    @ObservedObject var classifier: ImageClassifier

    var body: some View {
        VStack {
            Button {
                if let img = uiImage {
                    classifier.detect(uiImage: img)
                }
            } label: {
                Text("Начать идентификацию")
            }

            Group {
                if let imageClass = classifier.imageClass {
                    HStack{
                        Text("Категория картинки: ")
                            .font(.caption)
                        Text(imageClass)
                            .bold()
                    }
                } else {
                    HStack{
                        Text("Неопознанная категория картинки")
                            .font(.caption)
                    }
                }
            }
            .font(.subheadline)
            .padding()
        }
    }
}
