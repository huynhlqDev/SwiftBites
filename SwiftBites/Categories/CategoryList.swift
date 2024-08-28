//
//  CategoryList.swift
//  SwiftBites
//
//  Created by huynh on 28/8/24.
//

import SwiftUI
import SwiftData

struct CategoryList: View {

    @State private var query: String = ""
    @Query private var categories: [Category]

    init(query: String) {
        guard !query.isEmpty else { return }
        self.query = query
        self._categories = Query(filter: #Predicate<Category> { category in
            category.name.contains(query)
        })
    }

    var body: some View {
        if categories.isEmpty {
            empty
        } else {
            ScrollView(.vertical) {
                if categories.isEmpty {
                    noResults
                } else {
                    LazyVStack(spacing: 10) {
                        ForEach(categories, content: CategorySection.init)
                    }
                }
            }
        }
    }

    private var noResults: some View {
        ContentUnavailableView(
            label: {
                Text("Couldn't find \"\(query)\"")
            }
        )
    }

    private var empty: some View {
        ContentUnavailableView(
            label: {
                Label("No Categories", systemImage: "list.clipboard")
            },
            description: {
                Text("Categories you add will appear here.")
            },
            actions: {
                NavigationLink("Add Category", value: CategoryForm.Mode.add)
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
            }
        )
    }

}
