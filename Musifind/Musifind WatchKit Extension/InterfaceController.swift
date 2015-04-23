//
//  InterfaceController.swift
//  Musifind WatchKit Extension
//
//  Created by Bas Broek on 05/04/15.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import WatchKit
import MusiKit

class InterfaceController: WKInterfaceController, ImageDelegate
{
    @IBOutlet weak var artistTable: WKInterfaceTable!
	
	/// Array of artists in the tableView, if any.
    var artists = [Artist]()
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let newBand = Band("Daft Punk",
            image: "http://www.highsnobiety.com/files/2013/12/daft-punk-to-perform-at-The-Grammys-1.jpg")
        
        newBand.delegate = self
        self.artists.append(newBand)
        
        let musician = Musician("Bas Thomas Broek",
            image: "https://pbs.twimg.com/profile_images/565978319137800193/5IwM8U7o.jpeg",
            instruments: .Drums, .Guitar)
        
        musician.delegate = self
        self.artists.append(musician)
        
        let anotherMusician = Musician("Joost van Bergen",
            image: "https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-xaf1/v/t1.0-9/10639714_961155063901928_5582667649241911522_n.jpg?oh=ab37efc9c9fcfc473d85d54e820aeda6&oe=55AD8954&__gda__=1438399973_6d6526d165f772876a4bcf65b57a85b7",
            instruments: .Guitar)
        
        anotherMusician.delegate = self
        self.artists.append(anotherMusician)
        
        let anotherBand = Band("Capital Cities",
            image: "http://images1.miaminewtimes.com/imager/capital-cities-sebu-simonian-right-and/u/original/6442270/capital_cities_interview_miami_2014.jpg")
        
        anotherBand.delegate = self
        self.artists.append(anotherBand)
        
        let yetAnotherBand = Band("The Eagles",
            image: "https://s-media-cache-ak0.pinimg.com/originals/22/59/98/225998bef14f50f834c7fe0491665785.jpg")
        
        yetAnotherBand.delegate = self
        self.artists.append(yetAnotherBand)
        
        let yetAnotherMusician = Musician("Blackmill",
            image: "http://i.ytimg.com/vi/ldPzc_J0SBo/maxresdefault.jpg",
            instruments: .Piano, .Drums)
        
        yetAnotherMusician.delegate = self
        self.artists.append(yetAnotherMusician)
    }

    override func willActivate()
    {
        super.willActivate()
    }

    override func didDeactivate()
    {
        super.didDeactivate()
    }
    
    // MARK: - Image Delegate
	
	/**
		Protocol method for reloading if images have been pulled from the internet.
	*/
    func refresh(image: UIImage)
    {
		// FIXME: Only refresh one row at a time.
		self.loadTableData()
    }
    
    // MARK: - Methods
	
	/**
		Loads the table data to the tableView.
	*/
    private func loadTableData()
    {
        self.artistTable.setNumberOfRows(self.artists.count, withRowType: "musician")
        
        for (index, artist) in enumerate(self.artists)
        {
            let row = self.artistTable.rowControllerAtIndex(index) as! TableViewController
			
			let scaledImage = artist.avatar?.scaleImage(toHeight: 70.0)
            
			row.avatar.setImage(scaledImage ?? UIImage(named: "user"))
            row.nameLabel.setText(artist.name)
        }
    }
}