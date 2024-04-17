//
//  MealDetailsControllerViewModel.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 15/04/24.
//

import Foundation
import UIKit
import MapKit

class MealDetailsControllerViewModel{
    
    var onImageLoaded: ((UIImage?)->Void)?
    
    let meal: Meal
    
    init(_ meal: Meal) {
        self.meal = meal
        self.loadImage()
    }
    
    private func loadImage(){
        DispatchQueue.global().async { [weak self] in
            if let logoStr = self?.meal.strMealThumb,
               let logoURL = URL(string: logoStr),
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
        }
    }
    
    var mealName: String{
        return "Platillo: \(self.meal.strMeal)"
    }
    
    var mealDescription: String{
        return "Descripción: \(self.meal.strInstructions)"
    }
    
    var mealLocation: String{
        let converter = AreaToCountryConverter()
        let country = converter.areaToCountry(area: self.meal.strArea) ?? ""
        return "Area: \(country)"
    }
}
