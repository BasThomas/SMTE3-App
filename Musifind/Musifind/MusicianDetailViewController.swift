//
//  MusicianDetailViewController.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit
import CoreMotion

class MusicianDetailViewController: UIViewController
{
	/// The associated musician for the view, if any.
	var musician: Musician?
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var instrumentsLabel: UILabel!
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var addItem: UIBarButtonItem!

	override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.navigationController?.navigationBar.tintColor = .whiteColor()
		self.avatarImage.layer.masksToBounds = true
		
		if let musician = self.musician
		{
			self.navigationItem.title = musician.name
			
			self.nameLabel.text = musician.name
			
			var stringStruments = [String]()
			
			for instrument in musician.instruments
			{
				stringStruments.append(instrument.rawValue)
			}
			
			self.instrumentsLabel.text = ", ".join(stringStruments)
			
			if let avatar = musician.avatar
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
        // Dispose of any resources that can be recreated.
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