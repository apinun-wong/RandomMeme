//
//  HomeSection.swift
//  MVVM+Clean
//
//  Created by Apinun on 11/7/2566 BE.
//

import Foundation

final public class HomeSection: Hashable {
    var title: String
    var id: Int
    var items: [HomeItemType] = []
    public init(title: String, id: Int) {
        self.title = title
        self.id = id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: HomeSection, rhs: HomeSection) -> Bool {
      lhs.id == rhs.id
    }
}

public struct HomeItemType: Hashable {
    let title: String
    let shortDescription: String
}
