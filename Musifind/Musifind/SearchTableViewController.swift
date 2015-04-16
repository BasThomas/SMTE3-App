//
//  SearchTableViewController.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate, ImageDelegate
{
	var artists = [Artist]()
	var filtered = [Artist]()
	
	required init(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		
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
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		self.searchDisplayController!.searchResultsTableView.rowHeight = self.tableView.rowHeight
		
		let refresh = UIRefreshControl()
		refresh.addTarget(self, action: Selector("refresh"), forControlEvents: .ValueChanged)
		
		self.refreshControl = refresh
		self.searchDisplayController!.searchBar.tintColor = .musifindColor()
		
		// Fix the hairline.
		self.searchDisplayController!.searchBar.layer.borderColor = UIColor.searchBarColor().CGColor
		self.searchDisplayController!.searchBar.layer.borderWidth = 1
    }
	
	override func viewWillAppear(animated: Bool)
	{
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - ImageDelegate
	func refresh(image: UIImage)
	{
		tableView.reloadData()
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
	{
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
        // Return the number of rows in the section.
		if tableView == self.searchDisplayController!.searchResultsTableView
		{
			return self.filtered.count
		}
		else
		{
			return self.artists.count
		}
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		var musicianCell: MusicianTableViewCell
		var bandCell: BandTableViewCell
		
		var currentMusician: Musician?
		var currentBand: Band?
		
		if tableView == self.searchDisplayController!.searchResultsTableView
		{
			currentMusician = self.filtered[indexPath.row] as? Musician
			currentBand = self.filtered[indexPath.row] as? Band
		}
		else
		{
			currentMusician = self.artists[indexPath.row] as? Musician
			currentBand = self.artists[indexPath.row] as? Band
		}
		
		if let musician = currentMusician
		{
			musicianCell = self.tableView.dequeueReusableCellWithIdentifier("newMusician", forIndexPath: indexPath) as! MusicianTableViewCell
			
			musicianCell.musician = musician
			
			musicianCell.nameLabel.text = musicianCell.musician?.name
			
			if let avatar = musicianCell.musician?.avatar
			{
				musicianCell.cornerImage()
				musicianCell.avatarImage.image = avatar
			}
			
			if musicianCell.musician!.hasInstrument()
			{
				let firstInstrument = musicianCell.musician?.instruments.first
				//musicianCell.instrumentImage.image = UIImage(named: firstInstrument!.rawValue)
			}
			
			return musicianCell
		}
		else if let band = currentBand
		{
			bandCell = self.tableView.dequeueReusableCellWithIdentifier("newBand", forIndexPath: indexPath) as! BandTableViewCell
			
			bandCell.band = band
			
			bandCell.nameLabel.text = bandCell.band?.name
			
			if let avatar = bandCell.band?.avatar
			{
				bandCell.cornerImage()
				bandCell.avatarImage.image = avatar
			}
			
			return bandCell
		}
		
		return UITableViewCell()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
	{
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
	{
        if editingStyle == .Delete
		{
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
		else if editingStyle == .Insert
		{
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath)
	{

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
	{
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
	// MARK: - Searchbar data source
	
	func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool
	{
		let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
		let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
		
		self.filterContent(searchText: searchString, scope: selectedScope)
		
		return true
	}
	
	func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
	{
		let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
		
		self.filterContent(searchText: self.searchDisplayController!.searchBar.text, scope: scopes[searchOption])
		
		return true
	}
	
	/**
		Filters the list of clients according to the query.
		
		:param: searchText The query.
	*/
	private func filterContent(#searchText: String, scope: String)
	{
		self.filtered = self.artists.filter(
		{
			(artist: Artist) -> Bool in
			
			var categoryMatch = false
			
			switch(scope)
			{
				case "Bands":
					categoryMatch = ((artist as? Band) != nil)
				case "Musicians":
					categoryMatch = ((artist as? Musician) != nil)
				default:
					categoryMatch = true
				
			}
			
			var stringMatch = artist.name.lowercaseString.hasPrefix(searchText.lowercaseString)
			
			return categoryMatch && stringMatch
		})
	}
	
	// MARK: - Refresh
	
	func refresh()
	{
		tableView.reloadData()
		self.refreshControl?.endRefreshing()
	}

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
	{
		if segue.identifier == "musicianDetail"
		{
			let dvc = segue.destinationViewController as! MusicianDetailViewController
			
			let cell = sender as! MusicianTableViewCell
			
			dvc.musician = cell.musician
		}
		else if segue.identifier == "bandDetail"
		{
			let dvc = segue.destinationViewController as! BandDetailViewController
			
			let cell = sender as! BandTableViewCell
			
			dvc.band = cell.band
		}
    }
}