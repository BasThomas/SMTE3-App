//
//  Band.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

public class Band: Artist
{
	/// The musicians of a band, if any.
	public var musicians = [Musician]()
	
	public init(_ name: String, image: String? = nil)
	{
		super.init(name: name, image: image)
	}
	
	/**
		Adds a musician to the band.
	
		:param: musician The musician to add.
	*/
	public func addMusician(musician: Musician)
	{
		self.musicians.append(musician)
	}
}
