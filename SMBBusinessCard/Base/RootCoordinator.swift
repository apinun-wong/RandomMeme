//
//  RootCoordinator.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

protocol RootCoordinator: Coordinator {}

final class RootCoordinatorImpl: RootCoordinator {
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let splashCoordinator: SplashCoordinator = SplashCoordinatorImpl(navigationController: navigationController, parent: self)
        navigationController.setNavigationBarHidden(true, animated: false)
        splashCoordinator.start(animated: false)
    }
}
