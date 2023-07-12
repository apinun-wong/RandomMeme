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
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var telLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SMB ID CARD"
        self.logoImageView.setViewShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.input.viewWillAppear?()
    }
    @IBAction func didSelect(_ sender: Any) {
        var aaa = [Int] = []
        var bbb: [Int: Int] = [:]
        bbb.removeValue(forKey: <#T##Int#>)
    }
}
