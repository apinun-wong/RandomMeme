//
//  AboutViewController.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

final class AboutViewController: BaseViewController<AboutViewModel> {
    @IBOutlet weak var contactLabel: UILabel!
    private let email: String = "apinun.wong@gmail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.input.viewDidLoad?()
        setUpUI()
        bindInput()
    }
    private func setUpUI() {
        self.title = "About"
        let fullText = "contact: \(email)"
        contactLabel.text = fullText
        self.contactLabel.attributedText = viewModel.output.setupUnderLineText(fullText: fullText, emailText: email)
    }
    
    private func bindInput() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:)))
        contactLabel.isUserInteractionEnabled = true
        contactLabel.addGestureRecognizer(gesture)
    }
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: contactLabel, targetText: email) {
            self.launchEmail(email: email, subject: "Hi", message: "introduct your self")
        }
    }
}
