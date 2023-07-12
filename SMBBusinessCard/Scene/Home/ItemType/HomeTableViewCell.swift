//
//  HomeTableViewCell.swift
//  MVVM+Clean
//
//  Created by Apinun on 10/7/2566 BE.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 0.75)
        self.selectedBackgroundView = bgView
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(item: HomeItemType) {
        mainTitle.text = item.title
        subTitle.text = item.shortDescription
    }
}
