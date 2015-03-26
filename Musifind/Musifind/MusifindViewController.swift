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

        // Do any additional setup after loading the view.
		UITabBar.appearance().selectedImageTintColor = UIColor.musifindColor()
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}