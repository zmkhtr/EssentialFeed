//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by PT.Koanba on 22/02/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
