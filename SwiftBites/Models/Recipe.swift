//
//  Recipe.swift
//  SwiftBites
//
//  Created by huynh on 18/8/24.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable, Equatable {
    var id: UUID
    var name: String
    var summary: String
    var serving: Int
    var time: Int
    var instructions: String
    var imageData: Data?
    var category: Category?

    @Relationship(deleteRule: .cascade)
    var ingredients = [RecipeIngredient]()

    init(
        name: String = "",
        summary: String = "",
        serving: Int = 1,
        time: Int = 5,
        instructions: String = "",
        imageData: Data? = nil,
        category: Category? = nil
    ) {
        self.id = UUID()
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.instructions = instructions
        self.imageData = imageData
    }

    static func ==(lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }
}
