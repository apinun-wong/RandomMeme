//
//  Coordinator.swift
//  LotteryThExample
//
//  Created by Apinun on 5/7/2566 BE.
//

import UIKit

@objc public protocol BaseViewModelInputs: AnyObject {
    @objc optional func viewDidLoad() -> Void
    @objc optional func viewWillAppear() -> Void
    @objc optional func viewDidAppear() -> Void
    @objc optional func viewWillDisApprear() -> Void
    @objc optional func viewDidDisAppear() -> Void
}

public protocol BaseViewModelOutputs: AnyObject {
    var showLoading: (() -> Void)? { get set }
    var hideLoading: (() -> Void)? { get set }
}

open class BaseViewModel: NSObject {
    open var showLoading: (() -> Void)? = nil
    open var hideLoading: (() -> Void)? = nil
}
