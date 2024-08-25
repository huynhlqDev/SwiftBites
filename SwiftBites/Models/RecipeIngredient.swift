//
//  RecipeIngredient.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
final class RecipeIngredient: Identifiable, Equatable {
    let id: UUID
    var quantity: String

    @Relationship(deleteRule: .cascade)
    var ingredient: Ingredient?

    @Relationship(deleteRule: .cascade)
    var recipe: Recipe?

    init(id: UUID = UUID(), ingredient: Ingredient, quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }

    static func ==(lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }
}

