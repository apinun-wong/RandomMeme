//
//  CollectionView+Extension.swift
//  MVVM+Clean
//
//  Created by Apinun on 10/7/2566 BE.
//

import UIKit

extension UITableView {
    func registerNib(type: AnyClass, bundle: Bundle? = nil) {
        let nibName = String(describing: type)
        let nib = UINib(nibName: nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
    
    func registerNibHeaderFooter(type: AnyClass, bundle: Bundle? = nil) {
        let nibName = String(describing: type)
        let nib = UINib(nibName: nibName, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    open func dequeueReusableCell<T: UITableViewCell>() -> T? {
        let cellName = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: cellName) as? T
    }
}
