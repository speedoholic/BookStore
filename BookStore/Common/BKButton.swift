//
//  BKButton.swift
//  BookStore
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import UIKit

@IBDesignable
class BKButton: UIButton {
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        setTitleColor(UIColor.coral, for: .normal)
        refreshCorners(cornerRadius)
        refreshColor(color: UIColor.white)
    }
    
    // MARK: - Customizations
    
    fileprivate func refreshCorners(_ value: CGFloat) {
        layer.cornerRadius = value
    }
    
    fileprivate func createImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    fileprivate func refreshColor(color: UIColor, highColor: UIColor = UIColor.warmGrey) {
        let normalImage = createImage(color: color)
        setBackgroundImage(normalImage, for: UIControlState.normal)
        let highlightImage = createImage(color: highColor)
        setBackgroundImage(highlightImage, for: UIControlState.highlighted)
        clipsToBounds = true
    }
    
    // MARK: - Interface Builder
    
    @IBInspectable
    public var cornerRadius: CGFloat = 4.0 {
        didSet {
            refreshCorners(cornerRadius)
        }
    }
    
    @IBInspectable
    var backgroundImageColor: UIColor = UIColor.init(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1) {
        didSet {
            refreshColor(color: backgroundImageColor)
        }
    }
}
