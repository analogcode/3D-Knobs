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
            setNeedsLayout()
        }
    }

    @IBInspectable open var imageName: String = "knob01_" {
        didSet {
            createImageArray()
            setNeedsLayout()
        }
    }
    
    var imageView = UIImageView()
    var imageArray = [UIImage]()

    var currentFrame: Int {
      return Int(Double(knobValue) * Double(totalFrames))
    }

    public override func layoutSubviews() {
      super.layoutSubviews()
      imageView.frame = CGRect(
        x: 0,
        y: 0,
        width: self.bounds.width,
        height: self.bounds.height)
    }

    public override func draw(_ rect: CGRect) {
      super.draw(rect)      
      if imageArray.indices.contains(currentFrame) {
        imageView.image = imageArray[currentFrame]
      }
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
      createImageArray()
      imageView.image = UIImage(named: "\(imageName)0")
      addSubview(imageView)
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
