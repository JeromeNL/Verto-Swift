//
//  ImageToTextViewModel.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 05/02/2023.
//

import Foundation
import Vision
import UIKit

class ImageToTextViewModel{
    
    private func recognizeText(image: image) {
        guard let cgImage = image?.cgImage else {
            fatalError("could not get cgimage")
        }
        
        // Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        // Request
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
            
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        
        // Process request
        do {
            try handler.perform([request])
        }
        catch {
            label.text = "\(error)"
        }
    }
}
