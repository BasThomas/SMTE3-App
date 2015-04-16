//
//  MusifindViewController.swift
//  Musifind
//
//  Created by Bas on 26/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class MusifindViewController: UITabBarController
{
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		// FIXME: **BUG** Set the tintColor of the tabBar to musifindColor, as it can't be done in the storyboard. ¯\_(ツ)_/¯
		UITabBar.appearance().tintColor = .musifindColor()
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
    }
}