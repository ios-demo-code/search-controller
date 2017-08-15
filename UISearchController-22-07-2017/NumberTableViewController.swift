//
//  NumberTableViewController.swift
//  UISearchController-22-07-2017
//
//  Created by Soeng Saravit on 7/22/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class NumberTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    
    var filterNumbers:[String]!
    
    var searchController:UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        filterNumbers = numbers
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        
        self.tableView.tableHeaderView = self.searchController.searchBar

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = self.searchController.searchBar.text {
            if searchText != ""{
                filterNumbers = numbers.filter({ (result) -> Bool in
                    return result.lowercased().contains(searchText.lowercased())
                })
            }else{
                filterNumbers = numbers
            }
            
        }else {
            filterNumbers = numbers
        }
        self.tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterNumbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filterNumbers[indexPath.row]

        return cell
    }
    

}
