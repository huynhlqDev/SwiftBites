//
//  Recipe.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    var id: UUID
    var name: String
    var summary: String
    var serving: Int
    var time: Int
    var instructions: String
    var imageData: Data?
    @Relationship(deleteRule: .nullify)
    var category: Category?
    @Relationship(deleteRule: .cascade)
    var ingredients: [RecipeIngredient]

    init(
        id: UUID = UUID(),
        name: String = "",
        summary: String = "",
        serving: Int = 1,
        time: Int = 5,
        instructions: String = "",
        imageData: Data? = nil,
        category: Category? = nil,
        ingredients: [RecipeIngredient] = []
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageData = imageData
    }
}
