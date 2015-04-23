//
//  BandDetailViewController.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit
import CoreMotion

class BandDetailViewController: UIViewController
{
	/// The associated band for the view, if any.
	var band: Band?
	
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var addItem: UIBarButtonItem!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.navigationController?.navigationBar.tintColor = .whiteColor()
		self.avatarImage.layer.masksToBounds = true
		
		if let band = self.band
		{
			self.navigationItem.title = band.name

			if let avatar = band.avatar
			{
				self.avatarImage.image = avatar
			}
		}
		else
		{
			self.navigationItem.title = "Unknown"
		}
		
		if let font = UIFont(name: "FontAwesome", size: 20)
		{
			self.addItem.setTitleTextAttributes([NSFontAttributeName: font], forState: .Normal)
			self.addItem.title = "\u{f067}"
		}
		
		self.setupCoreMotion()
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
    }
	
	func setupCoreMotion()
	{
		let manager = CMMotionManager()
		
		if manager.deviceMotionAvailable
		{
			manager.deviceMotionUpdateInterval = 0.02
			manager.startDeviceMotionUpdates()
			
			manager.startDeviceMotionUpdatesToQueue(.mainQueue()) {
				(data: CMDeviceMotion!, error: NSError!) in
				
				if data.userAcceleration.x < -2.5
				{
					manager.stopDeviceMotionUpdates()
					self.navigationController?.popViewControllerAnimated(true)
				}
			}
		}
	}
}