//
//  UIButton+Initialise.swift
//  Initialise
//
//  Created by Joshua Campion on 23/09/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /**
     
     Convenience initialiser to create a stack view with a given set of properties.
     
     - parameter type: Must be provided to be passed to the button initialiser.
     
    */
    public convenience init(type: UIButtonType,
                     title: Text?,
                     image: UIImage? = nil,
                     font: UIFont,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     titleEdgeInsets: UIEdgeInsets = .zero,
                     imageEdgeInsets: UIEdgeInsets = .zero,
                     translatesAutoresizingMaskIntoConstraints: Bool = false) {
        
        self.init(type: type)
        
        if let text = title {
            switch text {
            case .plain(let str):
                self.setTitle(str, for: .normal)
            case .attributed(let str):
                self.setAttributedTitle(str, for: .normal)
            }
        }
        
        self.setImage(image, for: .normal)
        
        self.titleLabel?.font = font
        
        self.contentEdgeInsets = contentEdgeInsets
        self.titleEdgeInsets = titleEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
    
    public convenience init(type: UIButtonType,
                     title: Text?,
                     image: UIImage? = nil,
                     textStyle: UIFontTextStyle = .body,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     titleEdgeInsets: UIEdgeInsets = .zero,
                     imageEdgeInsets: UIEdgeInsets = .zero,
                     translatesAutoresizingMaskIntoConstraints: Bool = false) {
        
        self.init(type: type,
                  title: title,
                  image: image,
                  font: UIFont.preferredFont(forTextStyle: textStyle),
                  contentEdgeInsets: contentEdgeInsets,
                  titleEdgeInsets: titleEdgeInsets,
                  imageEdgeInsets: imageEdgeInsets,
                  translatesAutoresizingMaskIntoConstraints:translatesAutoresizingMaskIntoConstraints)
    }
}

