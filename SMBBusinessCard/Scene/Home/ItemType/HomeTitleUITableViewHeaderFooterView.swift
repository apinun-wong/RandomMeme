//
//  HomeTitleUITableViewHeaderFooterView.swift
//  MVVM+Clean
//
//  Created by Apinun on 11/7/2566 BE.
//

import UIKit

final public class HomeTitleUITableViewHeaderFooterView: UITableViewHeaderFooterView {
    lazy var titleUILabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp(title: String) {
        self.titleUILabel.text = title
    }
    
    private func setUpUI() {
        self.addSubview(titleUILabel)
        self.backgroundColor = .lightGray
        NSLayoutConstraint.activate([
            titleUILabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleUILabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            titleUILabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleUILabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
    }
}
