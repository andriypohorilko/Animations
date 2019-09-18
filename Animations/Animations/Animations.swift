//
//  Animations.swift
//  Animations
//
//  Created by Andriy Pohorilko on 9/18/19.
//  Copyright © 2019 Andriy Pohorilko. All rights reserved.
//

import UIKit

struct Animation {
    var duration: TimeInterval
    var delay: TimeInterval = 0
    var options: UIView.AnimationOptions = []
    var closure: (UIView) -> Void
    var completion: ((UIView) -> Void)? = nil
}

extension Animation {
    static func fadeIn(duration: TimeInterval = 1) -> Animation {
        return Animation(duration: duration, closure: { view in
            view.alpha = 1
        })
    }
    
    static func scale(to scaleX: CGFloat = 5.0, y: CGFloat = 5.0, duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, options: .autoreverse, closure: { view in
            view.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
        }, completion: { view in
            view.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}

extension UIView {
    func animate(_ animations: [Animation]) {
        guard !animations.isEmpty else {
            return
        }
        var animations = animations
        let currentAnimation = animations.removeFirst()
        
        UIView.animate(withDuration: currentAnimation.duration,
                       delay: currentAnimation.delay,
                       options: currentAnimation.options, animations: {
                        currentAnimation.closure(self)
                        
        }, completion: { _ in
            currentAnimation.completion?(self)
            self.animate(animations)
        })
    }
}
