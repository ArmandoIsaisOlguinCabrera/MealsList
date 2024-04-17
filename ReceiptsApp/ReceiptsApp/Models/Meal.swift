//
//  Meal.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 14/04/24.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let strMeal: String
    var strMealThumb: String
    let strInstructions: String
    let strArea: String
}
