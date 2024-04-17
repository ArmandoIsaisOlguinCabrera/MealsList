//
//  ViewController.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 14/04/24.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel: HomeControllerViewModel
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(MealCell.self, forCellReuseIdentifier: MealCell.identifier)
        return tv
    }()
    
    init(_ viewModel: HomeControllerViewModel = HomeControllerViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupSearchController()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel.onMealsUpdated = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupUI(){
        self.navigationItem.title = Constants.titleHomeScreenNavigationTitle
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func setupSearchController(){
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Ingredient o Meal"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
}

//MARK: - TableView Functions

extension HomeController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.updateSearchController(searchController.searchBar.text)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: MealCell.identifier, for: indexPath) as? MealCell else {
            fatalError("Error")
        }
        let inSearchMode = self.viewModel.inSearchModel(searchController)
        let meal = inSearchMode ? self.viewModel.filteredMeals[indexPath.row] : self.viewModel.meals[indexPath.row]
        cell.configure(with: meal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inSearchMode = self.viewModel.inSearchModel(searchController)
        return inSearchMode ? self.viewModel.filteredMeals.count : self.viewModel.meals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let inSearchMode = self.viewModel.inSearchModel(searchController)
        let meal = inSearchMode ? self.viewModel.filteredMeals[indexPath.row] : self.viewModel.meals[indexPath.row]
        let vm = MealDetailsControllerViewModel(meal)
        let vc = MealDetailsController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
