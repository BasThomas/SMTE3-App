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
	var band: Band?
	
	@IBOutlet weak var usersImage: UIImageView!
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
}