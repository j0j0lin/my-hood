//
//  PostCell.swift
//  example-my-hood
//
//  Created by momo on 9/30/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.postDesc
        img.image = DataService.sharedInstance.imageForPath(path: post.imagePath)
    }

}
