//
//  MusicianTableViewCell.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class MusicianTableViewCell: UITableViewCell
{
	var musician: Musician?
	
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var instrumentImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
    override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func cornerImage()
	{
		self.avatarImage.layer.cornerRadius = (self.avatarImage.frame.size.height / 2)
		self.avatarImage.layer.masksToBounds = true
	}
}