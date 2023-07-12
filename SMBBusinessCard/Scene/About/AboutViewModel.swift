//
//  AboutViewModel.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import Foundation
import UIKit

public protocol AboutInput: AnyObject, BaseViewModelInputs {}
public protocol AboutOutputs: AnyObject, BaseViewModelOutputs {
    func setupUnderLineText(fullText: String, emailText: String) -> NSAttributedString?
}

public protocol AboutViewModel: AboutInput, AboutOutputs {
    var input: AboutInput { get }
    var output: AboutOutputs { get }
}

final class AboutViewModelImpl: BaseViewModel, AboutViewModel {
    var input: AboutInput { return self }
    var output: AboutOutputs { return self }
    
    var aboutCoordinator: AboutCoordinator
    
    init(aboutCoordinator: AboutCoordinator) {
        self.aboutCoordinator = aboutCoordinator
        super.init()
    }

    func setupUnderLineText(fullText: String, emailText: String) -> NSAttributedString? {
        guard let emailRange = fullText.range(of: emailText) else { return nil }
        let emailNSRange = NSRange(emailRange, in: fullText)
        let attributedText = NSMutableAttributedString(string: fullText)
        attributedText.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue,
                                      .underlineColor: UIColor.blue,
                                      .foregroundColor: UIColor.blue], range: emailNSRange)
        return attributedText
    }
}
