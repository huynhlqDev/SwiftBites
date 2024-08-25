//
//  Category.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable, Equatable {
    var id: UUID

    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.category)
    var recipes = [Recipe]()

    init(name: String = "") {
        self.id = UUID()
        self.name = name
    }

    static func ==(lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}
