//
//  MusicianDetailViewController.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class MusicianDetailViewController: UIViewController
{
	var musician: Musician?
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var instrumentsLabel: UILabel!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
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
		}
		else
		{
			self.navigationItem.title = "Unknown"
		}
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}