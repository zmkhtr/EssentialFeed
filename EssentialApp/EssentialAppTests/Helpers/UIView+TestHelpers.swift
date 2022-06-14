//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by PT.Koanba on 14/06/22.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
