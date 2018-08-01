//
//  BooksTableViewController.swift
//  BookStore
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import UIKit
import AlamofireImage

class BooksTableViewController: UITableViewController {

    // MARK: - Properties
    
    var booksArray = [Book]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: R.nib.bookTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.bookTableViewCell.identifier)
        tableView.accessibilityIdentifier = "BooksTable"
        requestBooks()
        refreshControl = UIRefreshControl()
        refreshControl?.accessibilityIdentifier = "refreshControl"
        refreshControl?.addTarget(self, action: #selector(requestBooks), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - User Actions
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive) { (_) in
            if let delegate = UIApplication.shared.delegate as? AppDelegate, let loginController = R.storyboard.main.loginViewController() {
                delegate.setRoot(loginController)
            }
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        UIAlertHelper.showAlertWithTitle("Logout", message: "Are you sure you want to log out?", actions: [logoutAction,cancelAction], completionBlock: nil, onController: self)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.bookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {return UITableViewCell()}
        if booksArray.count > indexPath.row {
            let book = booksArray[indexPath.row]
            cell.titleLabel.text = book.title
            cell.subTitleLabel.text = book.author
            cell.accessibilityIdentifier = book.id
            if let imageUrl = URL(string: book.image) {
                cell.bookImageView.af_setImage(withURL: imageUrl)
            }
            
        } else {
            print("Books Index out of range")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

}

// MARK: - Web service call

extension BooksTableViewController: Requestable {
    @objc func requestBooks() {
        _ = setupNetworkComponentWith(netapi: NetworkAPI.getbooks, mapType: Book.self, mappedObjectHandle: nil, objectArrayHandle: { (responseArray) in
            self.booksArray = responseArray
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }, moreInfo: { (message) in
            switch message {
            case .success: break
            case .fail(let errorMessage):
                UIAlertHelper.showAlertWithTitle("Error", message: errorMessage, completionBlock: nil, onController: self)
            }
        })
    }

}
