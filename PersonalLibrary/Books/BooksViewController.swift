//
//  BooksViewController.swift
//  PersonalLibrary
//
//  Created by Noel Perez on 11/29/17.
//  Copyright © 2017 Noel C. Perez. All rights reserved.
//

import UIKit

protocol BooksViewControllerDelegate: class {
    func showBookDetails(_ viewController: BooksViewController, bookId: String)
}

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var booksController: BooksControllerProtocol?
    weak var delegate: BooksViewControllerDelegate?

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(cellType: BookTableViewCell.self)
        
        self.booksController?.viewModelUpdated = { [unowned self] in
            self.tableView.reloadData()
        }
        
        self.booksController?.fetchBooks()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.booksController?.booksViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: BookTableViewCell.self)
        
        if let viewModel = self.booksController?.booksViewModel?[indexPath.row]{
            cell.configure(viewModel: viewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}