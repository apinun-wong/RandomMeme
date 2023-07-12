//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Apinun on 4/7/2566 BE.
//

import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start(animated: Bool)
//    func popViewController(animated: Bool)
}
