//
//  GitUsersTableViewController.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation
import UIKit

class GitUsersTableViewController: UITableViewController,GitUsersViewModelDelegate {
    
    var viewModel = GitUsersViewModel()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.delegate = self
       
    }
    
    
    func setupView()
    {
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        tableView.reloadData()
    }
    
    func reloadTable(type: Int) {
        
        tableView.reloadData()
        
    }
    
}


extension GitUsersTableViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        
       if(searchController.searchBar.text!.count>0)
       {
        viewModel.getUsersList(queryString:  searchController.searchBar.text!)
       }

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        // return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        // return the number of rows
        if viewModel.userDetailsItems.count > 0 {

            return  viewModel.userDetailsItems.count
        }
        else
        {
            
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
      
         let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! GitUsersTableViewCell
         cell.nameLabel.text = (viewModel.userDetailsItems[indexPath.row]["name"] as? String)
         cell.loginLabel.text = (viewModel.userDetailsItems[indexPath.row]["login"] as? String)
         let publicRepoCount = (viewModel.userDetailsItems[indexPath.row]["public_repos"] as? Int)
         cell.publicRepoCountLabel.text = String(format: "%i", publicRepoCount!)
         let publicGistsCount = (viewModel.userDetailsItems[indexPath.row]["public_gists"] as? Int)
         cell.publicGistsCountLabel.text = String(format: "%i", publicGistsCount!)
         let followerCount = (viewModel.userDetailsItems[indexPath.row]["followers"] as? Int)
         cell.followerCountLabel.text = String(format: "%i", followerCount!)
         cell.locationLabel.text = (viewModel.userDetailsItems[indexPath.row]["location"] as? String)
        
        ImageLoader.getImagen(name:(viewModel.userDetailsItems[indexPath.row]["avatar_url"] as? String ?? "empty"), round: true, width: 45, height: 45, completion: { (image) in
               cell.avatarImageView.image = image
            
        })
        let location = (viewModel.userDetailsItems[indexPath.row]["location"] as? String)
        cell.updatedOnLabel.text = String(format: "updated on: %@",location!)
         return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 178.0;//Choose your custom row height
    }
    
    
}
