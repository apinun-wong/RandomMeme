//
//  SplashScreenViewModel.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import Foundation

public protocol SplashScreenInput: AnyObject, BaseViewModelInputs {}
public protocol SplashScreenOutputs: AnyObject, BaseViewModelOutputs {}

public protocol SplashScreenViewModel: SplashScreenInput, SplashScreenOutputs {
    var input: SplashScreenInput { get }
    var output: SplashScreenOutputs { get }
}

final class SplashScreenViewModelImpl: BaseViewModel, SplashScreenViewModel {
    var input: SplashScreenInput { return self }
    var output: SplashScreenOutputs { return self }
    
    var splashCoordinator: SplashCoordinator
    
    private var timeout: Double = 3
    
    init(splashCoordinator: SplashCoordinator) {
        self.splashCoordinator = splashCoordinator
        super.init()
    }
    
    func viewDidLoad() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self else { return }
            if self.timeout > 0.0 {
                self.timeout -= 1.0
            } else {
                splashCoordinator.routeToHomePage()
                timer.invalidate()
            }
        }
    }
}
