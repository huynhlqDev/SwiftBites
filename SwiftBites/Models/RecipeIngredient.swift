//
//  RecipeIngredient.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
class RecipeIngredient: Identifiable {
    var id: UUID
    @Relationship(deleteRule: .cascade)
    var ingredient: Ingredient
    var quantity: String

    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
}
