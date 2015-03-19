//
//  Band.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

public class Band
{
	public var name: String
	public var musicians = [Musician]()
	public var avatar: UIImage?
	
	public init(_ name: String)
	{
		self.name = name
	}
	
	public func addMusician(musician: Musician)
	{
		self.musicians.append(musician)
	}
}
