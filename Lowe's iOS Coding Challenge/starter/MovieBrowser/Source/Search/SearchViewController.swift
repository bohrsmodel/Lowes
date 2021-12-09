//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var delegate: SearchViewControllerDelegate?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = SearchViewModel()
    private var searchText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Search"
        view.backgroundColor = .systemBlue
        setupTableView()
    }
    @IBAction func goButton(_ sender: Any) {
        if var searchText = searchBar.text {
            searchText = searchText.replacingOccurrences(of: " ", with: "+")
            viewModel.fetchMovies( searchStr: searchText)
            setupVM()
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }
    
    func setupVM() {
        viewModel.bind {
            self.tableView.reloadData()
        }
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if var searchText = searchBar.text {
            searchText = searchText.replacingOccurrences(of: " ", with: "+")
            viewModel.fetchMovies(searchStr: searchText)
            setupVM()
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(movie: viewModel.getMovie(row: indexPath.row))
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMovie = viewModel.getMovie(row: indexPath.row) {
            delegate?.loadDetail(selectedMovie: selectedMovie)
        }
    }
}

