import SwiftUI
import SwiftData

struct RecipesView: View {
    @Query private var recipes: [Recipe]
    @State private var query = ""

    // MARK: - Body

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Recipes")
        }
    }

    // MARK: - Views


    @ViewBuilder
    private var content: some View {
        if recipes.isEmpty {
            empty
        } else {
            RecipeList(query: query)
            .searchable(text: $query)
        }
    }

    var empty: some View {
        ContentUnavailableView(
            label: {
                Label("No Recipes", systemImage: "list.clipboard")
            },
            description: {
                Text("Recipes you add will appear here.")
            },
            actions: {
                NavigationLink("Add Recipe", value: RecipeForm.Mode.add)
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
            }
        )
    }

}
