//
//  Collection+Extension.swift
//  MVVM+Clean
//
//  Created by Apinun on 11/7/2566 BE.
//

import Foundation

public extension Collection {
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
