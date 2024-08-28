import SwiftUI
import SwiftData

struct IngredientsView: View {
    let selection: ((Ingredient) -> Void)?
    @Query var ingredients: [Ingredient]
    @Query var recipeIngredients: [RecipeIngredient]
    @State private var query = ""

    init(selection: ((Ingredient) -> Void)? = nil) {
        self.selection = selection
    }
  // MARK: - Body

  var body: some View {
    NavigationStack {
      content
        .navigationTitle("Ingredients")
        .toolbar {
          if !ingredients.isEmpty {
            NavigationLink(value: IngredientForm.Mode.add) {
              Label("Add", systemImage: "plus")
            }
          }
        }
        .navigationDestination(for: IngredientForm.Mode.self) { mode in
          IngredientForm(mode: mode)
        }
    }
  }

  // MARK: - Views

  @ViewBuilder
  private var content: some View {
    IngredientList(query: query, selection: selection)
          .searchable(text: $query)
  }

}
