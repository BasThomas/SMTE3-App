//
//  SearchTableViewController.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import MusiKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate
{
	var musicians: [Musician]?
	var bands: [Band]?
	
	var filtered = [AnyObject]()
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		let refresh = UIRefreshControl()
		refresh.addTarget(self, action: Selector("refresh"), forControlEvents: .ValueChanged)
		
		self.refreshControl = refresh
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
			return 2
		}
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		var musicianCell: MusicianTableViewCell
		var bandCell: BandTableViewCell
		
		if indexPath.row > 0
		{
			bandCell = tableView.dequeueReusableCellWithIdentifier("band", forIndexPath: indexPath) as BandTableViewCell
			
			let band = Band("The Bandname")
			bandCell.band = band
			
			bandCell.nameLabel.text = bandCell.band?.name
			
			return bandCell
		}
		else
		{
			musicianCell = tableView.dequeueReusableCellWithIdentifier("musician", forIndexPath: indexPath) as MusicianTableViewCell
			
			let musician = Musician("Bas Thomas Broek", instruments: .Drums, .Guitar)
			musicianCell.musician = musician
			
			musicianCell.nameLabel.text = musicianCell.musician?.name
			
			return musicianCell
		}
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
		let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
		let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
		
		self.filterContent(searchText: searchString, scope: selectedScope)
		
		return true
	}
	
	func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
	{
		let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
		
		self.filterContent(searchText: self.searchDisplayController!.searchBar.text, scope: scopes[searchOption])
		
		return true
	}
	
	/**
		Filters the list of clients according to the query.
		
		:param: searchText The query.
	*/
	func filterContent(#searchText: String, scope: String)
	{
		println("searching for \"\(searchText)\" in scope \(scope)")
		/*self.filtered = self.clients.filter(
		{
			(object: AnyObject) -> Bool in
			
			var categoryMatch = (scope == "All") || (candy.category == scope)
			var stringMatch = candy.name.rangeOfString(searchText)
			
			return categoryMatch && (stringMatch != nil)
		})*/
	}
	
	// MARK: - Refresh
	
	func refresh()
	{
		println("refreshing")
		self.refreshControl?.endRefreshing()
	}

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
	{
		if segue.identifier == "musicianDetail"
		{
			let dvc = segue.destinationViewController as MusicianDetailViewController
			
			let cell = sender as MusicianTableViewCell
			
			dvc.musician = cell.musician
		}
		else if segue.identifier == "bandDetail"
		{
			let dvc = segue.destinationViewController as BandDetailViewController
			
			let cell = sender as BandTableViewCell
			
			dvc.band = cell.band
		}
    }
}