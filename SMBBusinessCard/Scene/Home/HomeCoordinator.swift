//
//  HomeCoordinator.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

protocol HomeCoordinator: Coordinator {
    var appTabBar: AppTabBarController? { get set }
    func routeToDetailPage(title: String, item: CodeStatusResponse)
}

final class HomeCoordinatorImpl: HomeCoordinator {
    var navigationController: UINavigationController
    var parent: AppTabBarCoordinator
    var appTabBar: AppTabBarController?
    
    init(navigationController: UINavigationController, appTabBar: AppTabBarController? = nil, parent: AppTabBarCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
        self.appTabBar = appTabBar
    }

    func start(animated: Bool) {
        let getHttpStatusUseCase = GetHttpStatusUseCaseImpl()
        let viewModel = HomeViewModelImpl(homeCoordinator: self,
                                          getHttpStatusUseCase: getHttpStatusUseCase)
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil, viewModel: viewModel)
        navigationController.setNavigationBarHidden(false, animated: true)
        vc.tabBarItem = UITabBarItem(title: "Home",
                                     image: UIImage(systemName: "house.fill"),
                                     selectedImage: nil)
        navigationController.pushViewController(vc, animated: animated)
    }

    func routeToDetailPage(title: String, item: CodeStatusResponse) {
        parent.appTabBar?.isHiddenView = true
        let httpDetailCoordinate: HttpDetailCoordinator = HttpDetailCoordinatorImpl(navigationController: navigationController,
                                                                                    appTabBar: parent.appTabBar,
                                                                                    parent: self,
                                                                                    title: title,
                                                                                    item: item)
        httpDetailCoordinate.start(animated: true)
    }
}

