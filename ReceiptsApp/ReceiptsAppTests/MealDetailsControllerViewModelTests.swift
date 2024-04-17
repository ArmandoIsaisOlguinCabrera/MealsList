import XCTest
@testable import ReceiptsApp

class MealDetailsControllerViewModelTests: XCTestCase {

    var viewModel: MealDetailsControllerViewModel!
    var meal: Meal!

    override func setUpWithError() throws {
        // Configurar los objetos necesarios para las pruebas
        meal = Meal( strMeal: "Enchiladas Verdes", strMealThumb: "https://i.blogs.es/efb378/1366_2000-1/450_1000.jpg", strInstructions: "Instrucciones para hacer enchiladas", strArea: "Mexican")
        viewModel = MealDetailsControllerViewModel(meal)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        meal = nil
    }

    func testMealName() throws {
        XCTAssertEqual(viewModel.mealName, "Platillo: Enchiladas Verdes")
    }

    func testMealDescription() throws {
        XCTAssertEqual(viewModel.mealDescription, "Descripción: Instrucciones para hacer enchiladas")
    }

    func testMealLocation() throws {
        XCTAssertEqual(viewModel.mealLocation, "Area: Mexican")
    }

    func testImageLoadedCallback() throws {
        let expectation = self.expectation(description: "Image Loaded")
        
        // Mock para el callback
        viewModel.onImageLoaded = { image in
            XCTAssertNotNil(image, "La imagen no debería ser nula")
            expectation.fulfill()
        }
        
        // Esperar a que se llame al callback
        waitForExpectations(timeout: 10, handler: nil)
    }
}
