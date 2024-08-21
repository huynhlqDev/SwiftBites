//
//  RecipeIngredient.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
struct RecipeIngredient: Identifiable, Hashable {
    let id: UUID
    var ingredient: Ingredient
    var quantity: String

    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }

    static func ==(lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
