import SwiftUI
import SwiftData

/// The main view that appears when the app is launched.
struct ContentView: View {
    @Query private var recipes: [Recipe]

    var body: some View {
        TabView {
            RecipesView(recipes: recipes)
                .tabItem {
                    Label("Recipes", systemImage: "frying.pan")
                }

            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "tag")
                }

            IngredientsView()
                .tabItem {
                    Label("Ingredients", systemImage: "carrot")
                }
        }
    }
}

#Preview {
    ContentView()
}
