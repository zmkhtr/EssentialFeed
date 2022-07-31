//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by PT.Koanba on 09/03/22.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
