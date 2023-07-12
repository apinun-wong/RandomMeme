//
//  AboutCoordinator.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

protocol AboutCoordinator: Coordinator {
    var appTabBar: AppTabBarController? { get set }
}

final class AboutCoordinatorImpl: AboutCoordinator {
    var navigationController: UINavigationController
    var parent: AppTabBarCoordinator
    var appTabBar: AppTabBarController?
    
    init(navigationController: UINavigationController, appTabBar: AppTabBarController? = nil, parent: AppTabBarCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
        self.appTabBar = appTabBar
    }

    func start(animated: Bool) {
        let viewModel = AboutViewModelImpl(aboutCoordinator: self)
        let vc = AboutViewController(nibName: "AboutViewController", bundle: nil, viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "About",
                                     image: UIImage(systemName: "gear.circle.fill"),
                                     selectedImage: nil)
        navigationController.pushViewController(vc, animated: animated)
    }
}
