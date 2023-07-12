//
//  BaseViewController.swift
//  LotteryThExample
//
//  Created by Apinun on 5/7/2566 BE.
//

import UIKit

open class BaseViewController<ViewModel>: UIViewController {
    open var viewModel: ViewModel!
    
    public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        DebugLogger.log("\(self)")
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        DebugLogger.retain()
    }
    
    private func showLoading() {
        
    }
    
    private func hideLoading() {
        
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
    }
    
    deinit {
        DebugLogger.release()
    }
}

