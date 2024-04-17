//
//  MealsService.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 15/04/24.
//

import Foundation

enum MealsServiceError: Error, Equatable{
    case serverError(String = "Server Error")
    case unknown(String = "Unknown Error")
    case decodingError(String = "Decoding Error")
}

class MealsService {
    static func fetchMeals(with endpoint: EndPoint, completion: @escaping (Result<[Meal], MealsServiceError>)->Void) {
        guard let request = endpoint.request else {return}
        print(request)
        URLSession.shared.dataTask(with: request){data, resp, error in
            if let error = error {
                print(error)
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                print("error")
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let mealData = try decoder.decode(Meals.self, from: data)
                    completion(.success(mealData.meals))
                } catch let err {
                    completion(.failure(.decodingError()))
                    print(err.localizedDescription)
                }
            } else {
                completion(.failure(.unknown()))
            }
        }.resume()
        
    }
}
