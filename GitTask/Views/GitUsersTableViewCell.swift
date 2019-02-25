//
//  GitUsersTableViewCell.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation
import UIKit

class GitUsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var updatedOnLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var publicGistsCountLabel: UILabel!
    @IBOutlet weak var publicRepoCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
}
