//
//  HomeViewController.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var pullDownButton: UIButton!
    @IBOutlet weak var telLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindingOutput()
        viewModel.input.viewDidLoad?()
    }
    
    private func setUpUI() {
        title = "SMB ID CARD"
        logoImageView.setViewShadow()
        setUpPullDownButton()
    }
    
    private func bindingOutput() {
        viewModel.output.changeFont = { familyFont in
            self.setUpFont(familyFont: familyFont)
        }
    }
    
    func setUpFont(familyFont: FamilyFont) {
        nameLabel.font = .customFont(family: familyFont, style: .mediumBold)
        jobLabel.font = .customFont(family: familyFont, style: .medium)
        emailLabel.font = .customFont(family: familyFont, style: .smallLight)
        addressLabel.font = .customFont(family: familyFont, style: .smallLight)
        telLabel.font = .customFont(family: familyFont, style: .smallLight)
    }
    
    private func setUpPullDownButton() {
        let fontsMenu = UIMenu(title: "Selected Fonts", identifier: .edit, options: .singleSelection, children: [
            UIAction(title: "Nunito", state: .on, handler: { [weak self] _ in
                guard let self else { return }
                self.viewModel.input.selectedFamilyFont(familyFont: .nunito)
            }),
            UIAction(title: "RobotoCondensed", handler: { [weak self] _ in
                guard let self else { return }
                self.viewModel.input.selectedFamilyFont(familyFont: .robotoCondensed)
            })
        ])
        pullDownButton.menu = fontsMenu
    }
}
