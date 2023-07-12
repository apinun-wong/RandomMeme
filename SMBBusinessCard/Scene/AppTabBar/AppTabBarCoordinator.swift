//
//  AppTabBarCoordinator.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

protocol AppTabBarCoordinator: Coordinator {
    var appTabBar: AppTabBarController? { get set }
    func getViewControllers() -> [UIViewController]
}

final class AppTabBarCoordinatorImpl: AppTabBarCoordinator {
    var navigationController: UINavigationController
    var appTabBar: AppTabBarController?
    var parent: Coordinator
    var homeCoordinator: HomeCoordinator?
    var aboutCoordinator: AboutCoordinator?
    private (set) var initCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }

    func start(animated: Bool) {
        let viewModel = AppTabBarViewModelImpl(appTabBarCoordinator: self)
        appTabBar = AppTabBarController(viewModel: viewModel)
        appTabBar?.modalPresentationStyle = .fullScreen
        guard let appTabBar else { return }
        self.navigationController.pushViewController(appTabBar, animated: false)
    }
    
    func getViewControllers() -> [UIViewController] {
        guard let homeCoordinator, let aboutCoordinator else {
            fatalError("Crash Please create home view and about view controoler")
        }
        return [homeCoordinator.navigationController,
                aboutCoordinator.navigationController]
    }
}

