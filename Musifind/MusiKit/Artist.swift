//
//  Artist.swift
//  Musifind
//
//  Created by Bas on 26/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

public protocol ImageDelegate
{
	func refresh(image: UIImage)
}

public class Artist
{
	public var name: String
	public var avatar: UIImage?
	{
		didSet
		{
			self.delegate?.refresh(self.avatar!)
		}
	}
	public var delegate: ImageDelegate?
	
	public init(name: String, image: String? = nil)
	{
		self.name = name
		
		if let image = image
		{
			self.addAvatar(image)
		}
	}
	
	public func addAvatar(avatar: String)
	{
		if let checkedURL = NSURL(string: avatar)
		{
			self.downloadImage(checkedURL)
		}
	}
	
	/**
		Converts URL response to data.
		
		:param: url The URL to get a respond for.
		:param: completion The completion handler for the response.
	*/
	private func getDataFromUrl(urL: NSURL, completion: ((data: NSData?) -> Void))
	{
		NSURLSession.sharedSession().dataTaskWithURL(urL)
		{ (data, response, error) in
			completion(data: NSData(data: data))
		}.resume()
	}
	
	/**
		Downloads an image.
		
		:param: url The URL of the image.
	*/
	private func downloadImage(url: NSURL)
	{
		self.getDataFromUrl(url)
		{ data in
			dispatch_async(dispatch_get_main_queue())
			{
				if let image = UIImage(data: data!)
				{
					self.avatar = image
				}
			}
		}
	}
}
