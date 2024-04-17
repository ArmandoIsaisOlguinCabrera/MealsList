//
//  HomeControllerViewModelTests.swift
//  ReceiptsAppTests
//
//  Created by Armando Isais Olguin Cabrera on 14/04/24.
//

import XCTest
@testable import ReceiptsApp

class HomeControllerViewModelTests: XCTestCase {

    var viewModel: HomeControllerViewModel!

    override func setUpWithError() throws {
        // Configurar los objetos necesarios para las pruebas
        viewModel = HomeControllerViewModel()
    }

    override func tearDownWithError() throws {
        // Limpiar los objetos después de las pruebas
        viewModel = nil
    }

    func testFetchMealsSuccess() throws {
        // Given
        let expectation = self.expectation(description: "Fetch Meals Success")
        
        // When
        viewModel.onMealsUpdated = {
            // Then
            XCTAssertFalse(self.viewModel.meals.isEmpty, "La lista de comidas no debería estar vacía")
            expectation.fulfill()
        }
        
        // Esperar a que se complete la operación de búsqueda de comidas
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testInSearchModel_WithInactiveSearch_ReturnsFalse() throws {
        // Given
        let searchController = UISearchController()
        searchController.isActive = false
        searchController.searchBar.text = "pizza"

        // When
        let result = viewModel.inSearchModel(searchController)

        // Then
        XCTAssertFalse(result, "La función inSearchModel debería devolver false cuando la búsqueda está inactiva")
    }

    func testInSearchModel_WithEmptyText_ReturnsFalse() throws {
        // Given
        let searchController = UISearchController()
        searchController.isActive = true
        searchController.searchBar.text = ""

        // When
        let result = viewModel.inSearchModel(searchController)

        // Then
        XCTAssertFalse(result, "La función inSearchModel debería devolver false cuando el texto de búsqueda está vacío")
    }

    func testUpdateSearchController() throws {
        // Given
        let searchText = "mole"
        viewModel.meals = [Meal(strMeal: "Mole Rojo", strMealThumb: "https://assets.elgourmet.com/wp-content/uploads/2023/03/cover_r6h4y2ebsg_mole-rojo-1024x683.jpg.webp", strInstructions: "Instrucciones del mole rojo", strArea: "Mexican")]
        
        // When
        viewModel.updateSearchController(searchText)
        
        // Then
        XCTAssertEqual(viewModel.filteredMeals.count, 1, "Debería haber una comida filtrada")
    }
}
