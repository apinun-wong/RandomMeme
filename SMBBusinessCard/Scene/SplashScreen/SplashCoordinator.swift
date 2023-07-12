//
//  SplashCoordinator.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

protocol SplashCoordinator: Coordinator {
    func routeToHomePage()
}

final class SplashCoordinatorImpl: SplashCoordinator {
    var navigationController: UINavigationController
    var parent: RootCoordinator
    
    init(navigationController: UINavigationController, parent: RootCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }

    func start(animated: Bool) {
        let viewModel = SplashScreenViewModelImpl(splashCoordinator: self)
        let vc = SplashScreenViewController(nibName: "SplashScreenViewController", bundle: nil, viewModel: viewModel)
        navigationController.pushViewController(vc, animated: animated)
    }

    func routeToHomePage() {
        let appTabBarCoordinator = AppTabBarCoordinatorImpl(navigationController: navigationController,
                                                            parent: self)
        let homeNavigationViewController = UINavigationController()
        let aboutNavigationViewController = UINavigationController()
        let homeCoordinator = HomeCoordinatorImpl(navigationController: homeNavigationViewController, parent: appTabBarCoordinator)
        let aboutCoordinator = AboutCoordinatorImpl(navigationController: aboutNavigationViewController, parent: appTabBarCoordinator)
        homeCoordinator.start(animated: false)
        aboutCoordinator.start(animated: false)
        appTabBarCoordinator.homeCoordinator = homeCoordinator
        appTabBarCoordinator.aboutCoordinator = aboutCoordinator
        appTabBarCoordinator.start(animated: false)
        homeCoordinator.appTabBar = appTabBarCoordinator.appTabBar
        aboutCoordinator.appTabBar = appTabBarCoordinator.appTabBar
    }
}
