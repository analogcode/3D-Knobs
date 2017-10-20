//
//  ViewTest.swift
//  UniversalKnob
//
//  Created by Matthew Fecher on 10/20/17.
//  Copyright © 2017 Matthew Fecher. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
public class ViewTest: UIView {
    
    var totalFrames: Int = 127
      
    var imageName: String = "knob01_" {
        didSet {
            createImageArray()
        }
    }
    
    var imageView = UIImageView()
    var currentFrame = 0
    var imageArray = [UIImage]()

    // Init / Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // Create Image Array
    func createImageArray() {
        imageArray.removeAll()
        for i in 0...totalFrames {
            let name = imageName + String(i)
            let image = UIImage(named: name)
            imageArray.append(image!)
        }
    }
    
    // Draw Frame
    public override func draw(_ rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        //// Get Current Image from imageArray
        guard var newImage = UIImage(named: "\(imageName)0") else { return }
        if imageArray.count > 0 {
           newImage = imageArray[currentFrame]
        }
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 150, height: 150))
        context.saveGState()
        rectanglePath.addClip()
        context.scaleBy(x: 1, y: -1)
        context.draw(newImage.cgImage!, in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height), byTiling: true)
        context.restoreGState()
        
        context.restoreGState()
    }

}
