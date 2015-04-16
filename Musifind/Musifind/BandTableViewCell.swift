//
//  BandTableViewCell.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class BandTableViewCell: UITableViewCell
{
	/// The associated band for the cell, if any.
	var band: Band?
	
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var instrumentImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
    override func awakeFromNib()
	{
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)
    }
	
	/**
		Makes the image in the cell a circle, adds orange border.
	*/
	func cornerImage()
	{
		self.avatarImage.layer.cornerRadius = (self.avatarImage.frame.size.height / 2)
		self.avatarImage.layer.masksToBounds = true
		self.avatarImage.layer.borderWidth = 5
		self.avatarImage.layer.borderColor = UIColor.musifindColor().CGColor
	}
}