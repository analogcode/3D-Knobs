//
//  ImageKnob.swift
//  UniversalKnob
//
//  Created by Matthew Fecher on 10/19/17.
//  Copyright © 2017 Matthew Fecher. All rights reserved.
//

import UIKit

@IBDesignable
public class ImageKnob: Knob {
    
    @IBInspectable open var totalFrames: Int = 0 {
        didSet {
            createImageArray()
        }
    }
    @IBInspectable open var imageName: String = "knob01_" {
        didSet {
            createImageArray()
        }
    }
    
    var imageView = UIImageView()
    var currentFrame = 0
    var imageArray = [UIImage]()
    
    // Knob properties
    override var knobValue: CGFloat {
        didSet {
           currentFrame = Int(Double(knobValue) * Double(totalFrames))
           setNeedsDisplay()
        }
    }
    
    // Draw Frame
    public override func draw(_ rect: CGRect) {
      if imageArray.indices.contains(currentFrame) {
        imageView.image = imageArray[currentFrame]
      }
      super.draw(rect)
    }
  
    // Init / Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
      // Add UIImageView
      let image = UIImage(named: "\(imageName)0")
      imageView = UIImageView(image: image)
      imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
      self.addSubview(imageView)
    }
    
    // Create Image Array
    func createImageArray() {
        imageArray.removeAll()
        for i in 0..<totalFrames {
            guard let image = UIImage(named: "\(imageName)\(i)") else { continue }
            imageArray.append(image)
        }
    }

}
