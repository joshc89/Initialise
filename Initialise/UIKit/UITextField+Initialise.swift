//
//  UITextField+Initialise.swift
//  Initialise
//
//  Created by Joshua Campion on 23/09/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public extension UITextField {
    
    
    public convenience init(text: Text?,
                     placeholder: Text?,
                     font: UIFont,
                     borderStyle: UITextBorderStyle = .roundedRect,
                     keyboardType: UIKeyboardType = .default,
                     returnKeyType: UIReturnKeyType = .default,
                     autocapitalizationType: UITextAutocapitalizationType = .sentences,
                     autocorrectionType: UITextAutocorrectionType = .default,
                     isSecureTextEntry: Bool = false,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
        ) {
        
        self.init()
        
        self.font = font
        
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        
        self.isSecureTextEntry = isSecureTextEntry
        
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        self.borderStyle = borderStyle
        
        set(text: text)
        set(placeholder: placeholder)
    }
    
    public convenience init(text: Text?,
                     placeholder: Text?,
                     textStyle: UIFontTextStyle = .body,
                     borderStyle: UITextBorderStyle = .roundedRect,
                     keyboardType: UIKeyboardType = .default,
                     returnKeyType: UIReturnKeyType = .default,
                     autocapitalizationType: UITextAutocapitalizationType = .sentences,
                     autocorrectionType: UITextAutocorrectionType = .default,
                     isSecureTextEntry: Bool = false,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
        ) {
        
        self.init(text: text,
                  placeholder: placeholder,
                  font: UIFont.preferredFont(forTextStyle: textStyle),
                  borderStyle: borderStyle,
                  keyboardType: keyboardType,
                  autocapitalizationType: autocapitalizationType,
                  autocorrectionType: autocorrectionType,
                  isSecureTextEntry: isSecureTextEntry,
                  translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints)
        
    }
    
    public static func createEmailInput(placeholder: Text?,
                                 font: UIFont,
                                 borderStyle: UITextBorderStyle = .roundedRect,
                                 returnKeyType: UIReturnKeyType = .default) -> UITextField {
        
        return UITextField(text: nil,
                           placeholder: placeholder,
                           font: font,
                           borderStyle: borderStyle,
                           keyboardType: .emailAddress,
                           returnKeyType: returnKeyType,
                           autocapitalizationType: .none,
                           autocorrectionType: .no,
                           isSecureTextEntry: false)
    }
    
    public static func createEmailInput(placeholder: Text?,
                                 textStyle: UIFontTextStyle = .body,
                                 borderStyle: UITextBorderStyle = .roundedRect,
                                 returnKeyType: UIReturnKeyType = .default) -> UITextField {
        
        return self.createEmailInput(placeholder: placeholder,
                                     font: UIFont.preferredFont(forTextStyle: textStyle),
                                     borderStyle: borderStyle,
                                     returnKeyType: returnKeyType)
    }
    
    
    public static func createPasswordInput(placeholder: Text?,
                                    font: UIFont,
                                    borderStyle: UITextBorderStyle = .roundedRect,
                                    returnKeyType: UIReturnKeyType = .default) -> UITextField {
        
        return UITextField(text: nil,
                           placeholder: placeholder,
                           font: font,
                           borderStyle: borderStyle,
                           keyboardType: .default,
                           returnKeyType: returnKeyType,
                           autocapitalizationType: .none,
                           autocorrectionType: .no,
                           isSecureTextEntry: true)
    }
    
    public static func createPasswordInput(placeholder: Text?,
                                    textStyle: UIFontTextStyle = .body,
                                    borderStyle: UITextBorderStyle = .roundedRect,
                                    returnKeyType: UIReturnKeyType = .default) -> UITextField {
        
        return self.createPasswordInput(placeholder: placeholder,
                                        font: UIFont.preferredFont(forTextStyle: textStyle),
                                        borderStyle: borderStyle,
                                        returnKeyType: returnKeyType)
    }
    
    /// Sets either the `text` or `attributedText` based on the given `Text` object.
    public func set(text: Text?) {
        
        if let t = text {
            switch t {
            case .plain(let str):
                self.text = str
            case .attributed(let str):
                self.attributedText = str
            }
        } else {
            self.text = nil
            self.attributedText = nil
        }
    }
    
    /// Sets either the `placeholder` or `attributedPlaceholder` based on the given `Text` object.
    public func set(placeholder: Text?) {
        
        if let t = placeholder {
            switch t {
            case .plain(let str):
                self.placeholder = str
            case .attributed(let str):
                self.attributedPlaceholder = str
            }
        } else {
            self.placeholder = nil
            self.attributedPlaceholder = nil
        }
    }
}
