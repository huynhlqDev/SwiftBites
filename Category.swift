//
//  Category.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable {
    var id: UUID
    var name: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
        self.id = id
        self.name = name
        self.recipes = recipes
    }
}
