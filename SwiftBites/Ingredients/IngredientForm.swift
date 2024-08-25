import SwiftUI
import SwiftData

struct IngredientForm: View {
  enum Mode: Hashable {
    case add
    case edit(Ingredient)
  }

  var mode: Mode

  init(mode: Mode) {
    self.mode = mode
    switch mode {
    case .add:
      _name = .init(initialValue: "")
      title = "Add Ingredient"
    case .edit(let ingredient):
      _name = .init(initialValue: ingredient.name)
      title = "Edit \(ingredient.name)"
    }
  }

  private let title: String
  @State private var name: String
  @State private var error: Error?
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context
  @Query var ingredients: [Ingredient]
  @FocusState private var isNameFocused: Bool

  // MARK: - Body

  var body: some View {
    Form {
      Section {
        TextField("Name", text: $name)
          .focused($isNameFocused)
      }
      if case .edit(let ingredient) = mode {
        Button(
          role: .destructive,
          action: {
            delete(ingredient: ingredient)
          },
          label: {
            Text("Delete Ingredient")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        )
      }
    }
    .onAppear {
      isNameFocused = true
    }
    .onSubmit {
      save()
    }
    .navigationTitle(title)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button("Save", action: save)
          .disabled(name.isEmpty)
      }
    }
  }

  // MARK: - Data

  private func delete(ingredient: Ingredient) {
      do {
          for recipeIngredient in ingredient.recipeIngredients {
              context.delete(recipeIngredient)
          }
          context.delete(ingredient)
          try context.save()
      } catch {
          self.error = error
      }
    dismiss()
  }

  private func save() {
    do {
      switch mode {
      case .add: 
          let ingredient = Ingredient(name: name)
          context.insert(ingredient)
      case .edit(let ingredient):
          ingredient.name = name
      }
        try context.save()
      dismiss()
    } catch {
      self.error = error
    }
  }
}
