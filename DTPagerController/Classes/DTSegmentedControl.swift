//
//  DTSegmentedControl.swift
//  Pods
//
//  Created by tungvoduc on 15/09/2017.
//
//

import UIKit

// Protocol
// SegmentedControl
public protocol DTSegmentedControlProtocol {

    var selectedSegmentIndex: Int { get set }

    func setTitle(_ title: String?, forSegmentAt segment: Int)

    func setImage(_ image: UIImage?, forSegmentAt segment: Int)
    
    func setTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State)
    
}

open class DTSegmentedControl: UISegmentedControl, DTSegmentedControlProtocol {

    public override init(items: [Any]?) {
        super.init(items: items)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        setTintColor(.clear)
        self.clearBG()
    }
    
    private func setTintColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            selectedSegmentTintColor = color
        } else {
            tintColor = color
        }
    }
}


extension UISegmentedControl {
    func clearBG() {
        setBackgroundImage(imageWithColor(color: UIColor.clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor.clear), for: .normal, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
