//
//  MealCell.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 14/04/24.
//

import UIKit

class MealCell: UITableViewCell{
    static let identifier = "MealCell"
    
    // MARK: - Variables
    private(set) var meal: Meal!
    
    // MARK: - UI Components
    
    private let mealPreview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .blue
        return imageView
    }()
    
    private var mealName: UILabel = {
        let mealName = UILabel()
        mealName.textColor = .label
        mealName.textAlignment = .left
        mealName.font = .systemFont(ofSize: 22, weight: .semibold)
        mealName.text = "Error"
        return mealName
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with meal: Meal){
        self.meal = meal
        self.mealName.text = meal.strMeal
        DispatchQueue.global().async { [weak self] in
            let logoSTR = meal.strMealThumb
            if let logoURL = URL(string: logoSTR),
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data:imageData) {
                DispatchQueue.main.async {
                    self?.mealPreview.image = logoImage
                }
            }
        }
    }
    
    // TODO: - Prepare to reuse
    
    // MARK: - UI Setup
    private func setupUI(){
        self.addSubview(mealPreview)
        self.addSubview(mealName)
        mealPreview.translatesAutoresizingMaskIntoConstraints = false
        mealName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mealPreview.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mealPreview.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            mealPreview.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            mealPreview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            mealName.leadingAnchor.constraint(equalTo: mealPreview.trailingAnchor, constant: 16),
            mealName.centerYAnchor.constraint(equalTo:self.centerYAnchor)
            
        ])
    }
}
