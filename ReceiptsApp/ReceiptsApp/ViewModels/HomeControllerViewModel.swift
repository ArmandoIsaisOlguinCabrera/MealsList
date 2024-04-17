//
//  HomeControllerViewModel.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 15/04/24.
//

import UIKit

class HomeControllerViewModel {
    
    var onMealsUpdated: (()->Void)?
    var onErrorMessage: ((MealsServiceError)->Void)?
    
    var meals: [Meal] = [] {
        didSet{
            self.onMealsUpdated?()
        }
    }
    
    private(set) var filteredMeals: [Meal] = []
    
    init(){
        self.fetchMeals()
    }
    
    public func fetchMeals(){
        let endpoint = EndPoint.fetchMeals()
        MealsService.fetchMeals(with: endpoint) { [weak self] result in
            switch result{
            case .success(let meals):
                self?.meals = meals
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}

extension HomeControllerViewModel{
    public func inSearchModel(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(_ searchBarText: String?){
        self.filteredMeals = meals
        if let searchText = searchBarText?.lowercased(){
            guard !searchText.isEmpty else { self.onMealsUpdated?(); return}
            self.filteredMeals = self.filteredMeals.filter({
                $0.strMeal.lowercased().contains(searchText) || $0.strInstructions.lowercased().contains(searchText)
            })
        }
        self.onMealsUpdated?()
    }
}
