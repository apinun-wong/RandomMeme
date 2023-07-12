//
//  AppTabBarController.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

final class AppTabBarController: UITabBarController {
    private (set) var initCoordinators = [Coordinator]()
    private var viewModel: AppTabBarViewModel
    
    var isHiddenView: Bool = false {
        didSet {
            self.tabBar.isHidden = isHiddenView
            self.tabBar.layer.zPosition = isHiddenView ? -1 : 0
        }
    }
    
    init(viewModel: AppTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "AppTabBarController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        self.hidesBottomBarWhenPushed = true
        tabBar.tintColor = .label
        viewControllers = viewModel.navigationControllers
    }

    func hideNavigationController() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

