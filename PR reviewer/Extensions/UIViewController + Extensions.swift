//
//  UIViewController + Extensions.swift
//  PR reviewer
//
//  Created by Faizan Memon on 09/10/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showToast(message : String, font: UIFont, duration: Double = 4) {
        let width = self.view.frame.size.width - 40
        let rect = CGRect(
            x: self.view.frame.size.width/2 - (width / 2),
            y: self.view.frame.size.height-100,
            width: width,
            height: 35
        )
        let toastLabel = UILabel(frame: rect)
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(
            withDuration: duration,
            delay: .zero,
            options: .curveEaseOut,
            animations: {
                toastLabel.alpha = 0.0
        }, completion: { isCompleted in
            toastLabel.removeFromSuperview()
        })
    }
}
