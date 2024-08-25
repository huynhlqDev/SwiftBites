//
//  Ingredient.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
final class Ingredient: Identifiable, Equatable {
    let id: UUID
    @Attribute(.unique) var name: String

    @Relationship(deleteRule: .cascade, inverse: \RecipeIngredient.ingredient)
    var recipeIngredients = [RecipeIngredient]()

    init(name: String) {
        self.id = UUID()
        self.name = name
    }

    static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
}
