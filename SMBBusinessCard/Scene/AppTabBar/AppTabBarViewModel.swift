//
//  BaseTabBarViewModel.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

public protocol AppTabBarInput: AnyObject, BaseViewModelInputs {}
public protocol AppTabBarOutputs: AnyObject, BaseViewModelOutputs {
    var navigationControllers: [UIViewController] { get }
}

public protocol AppTabBarViewModel: AppTabBarInput, AppTabBarOutputs {
    var input: AppTabBarInput { get }
    var output: AppTabBarOutputs { get }
}

final class AppTabBarViewModelImpl: BaseViewModel, AppTabBarViewModel {
    var input: AppTabBarInput { return self }
    var output: AppTabBarOutputs { return self }
    
    var navigationControllers: [UIViewController] = []
    var appTabBarCoordinator: AppTabBarCoordinator
    
    init(appTabBarCoordinator: AppTabBarCoordinator) {
        self.appTabBarCoordinator = appTabBarCoordinator
        self.navigationControllers = appTabBarCoordinator.getViewControllers()
    }
}

