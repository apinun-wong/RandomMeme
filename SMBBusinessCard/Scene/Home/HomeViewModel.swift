//
//  HomeViewModel.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import Foundation

public protocol HomeInput: AnyObject, BaseViewModelInputs {
    func selectedFamilyFont(familyFont: FamilyFont)
}
public protocol HomeOutputs: AnyObject, BaseViewModelOutputs {
    var changeFont: ((_ familyFont: FamilyFont) -> Void)? { get set }
}

public protocol HomeViewModel: HomeInput, HomeOutputs {
    var input: HomeInput { get }
    var output: HomeOutputs { get }
}

final class HomeViewModelImpl: BaseViewModel, HomeViewModel {
    var input: HomeInput { return self }
    var output: HomeOutputs { return self }
    
    var homeCoordinator: HomeCoordinator
    var changeFont: ((_ familyFont: FamilyFont) -> Void)?
    var familyFont: FamilyFont = .nunito
    
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
        super.init()
    }
}

// Input
extension HomeViewModelImpl {
    func selectedFamilyFont(familyFont: FamilyFont) {
        changeFont?(familyFont)
    }
    
    func viewDidLoad() {
        changeFont?(familyFont)
    }
    
    func viewWillAppear() {
        homeCoordinator.appTabBar?.isHiddenView = false
    }
}

// Output
extension HomeViewModelImpl {
}
