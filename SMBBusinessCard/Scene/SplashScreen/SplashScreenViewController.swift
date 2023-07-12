//
//  SplashScreenViewController.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

final class SplashScreenViewController: BaseViewController<SplashScreenViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.input.viewDidLoad?()
    }
}

