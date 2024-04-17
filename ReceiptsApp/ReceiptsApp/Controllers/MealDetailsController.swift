//
//  MealDetailsController.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 14/04/24.
//

import UIKit

class MealDetailsController: UIViewController{
    
    let viewModel: MealDetailsControllerViewModel
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let HeaderLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lblName = UILabel()
        lblName.textColor = .label
        lblName.textAlignment = .center
        lblName.font = .systemFont(ofSize: 20, weight: .semibold)
        return lblName
    }()
    
    private let descriptionLabel: UILabel = {
        let lblDescription = UILabel()
        lblDescription.textColor = .label
        lblDescription.textAlignment = .left
        lblDescription.font = .systemFont(ofSize: 20, weight: .light)
        lblDescription.numberOfLines = 0
        lblDescription.setContentCompressionResistancePriority(.required, for: .horizontal)
        return lblDescription
    }()
    
    private let locationButton: UIButton = {
        let locationBtn = UIButton()
        locationBtn.setImage(UIImage(systemName: "map"), for: .normal)
        locationBtn.semanticContentAttribute = .forceRightToLeft
        locationBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        locationBtn.setTitle("View in maps", for: .normal)
        locationBtn.setTitleColor(.white, for: .normal)
        locationBtn.layer.cornerRadius = 10
        locationBtn.backgroundColor = .systemGreen
        locationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        locationBtn.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
        return locationBtn
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [locationButton,nameLabel,descriptionLabel])
        vStack.axis = .vertical
        vStack.spacing = 12
        vStack.distribution = .fill
        vStack.alignment = .center
        return vStack
    }()
    
    @objc private func handleLoginButtonTapped() {
        let vm = MapControllerViewModel(viewModel.meal)
        let vc = MapController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    init(_ viewModel: MealDetailsControllerViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = self.viewModel.meal.strMeal
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        self.nameLabel.text = viewModel.mealName
        self.descriptionLabel.text = viewModel.mealDescription
        let titleButton = viewModel.mealLocation
        self.locationButton.setTitle(titleButton, for: .normal)
        self.viewModel.onImageLoaded = {[weak self] logoImage in
            DispatchQueue.main.async{
                self?.HeaderLogo.image = logoImage
            }
        }
    }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(HeaderLogo)
        self.contentView.addSubview(vStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        HeaderLogo.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let heigth = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heigth.priority = UILayoutPriority(1)
        heigth.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            HeaderLogo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            HeaderLogo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            HeaderLogo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            HeaderLogo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            HeaderLogo.heightAnchor.constraint(equalToConstant: 200),
            
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: HeaderLogo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            locationButton.widthAnchor.constraint(equalToConstant: 300),
            locationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
