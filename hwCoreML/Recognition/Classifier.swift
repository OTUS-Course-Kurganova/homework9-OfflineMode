//
//  Classifier.swift
//  hwCoreML
//
//  Created by Alexandra Kurganova on 05.05.2023.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    private(set) var results: String?

    mutating func detect(ciImage: CIImage) {
        print(ciImage)
        let model = try! CatsDogsImageClassifier(configuration: MLModelConfiguration()).model
        guard let model = try? VNCoreMLModel(for: model) else {
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            print("callback: ", request.results)
            if let error = error {
                print(request.debugDescription, error)
            }
        }
        // request.imageCropAndScaleOption = .centerCrop
#if targetEnvironment(simulator)
        request.usesCPUOnly = true
#endif
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        try? handler.perform([request])
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        print(results)
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
    }
}
