//
//  Musician.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

public class Musician
{
	public var name: String
	
	public var instruments = [Instrument.None]
	public var avatar: UIImage?
	
	public init(_ name: String)
	{
		self.name = name
	}
	
	public convenience init(_ name: String, instruments: Instrument...)
	{
		self.init(name)
		
		self.instruments = instruments
	}
	
	public convenience init(_ name: String, instrument: Instrument)
	{
		self.init(name)
		
		self.addInstrument(instrument)
	}
	
	public func addInstrument(instrument: Instrument)
	{
		if self.hasInstrument()
		{
			self.instruments.append(instrument)
		}
		else
		{
			self.instruments = [instrument]
		}
	}
	
	private func addInstruments(instruments: Instrument...)
	{
		if self.hasInstrument()
		{
			for instrument in instruments
			{
				self.instruments.append(instrument)
			}
		}
		else
		{
			self.instruments = instruments
		}
	}
	
	public func removeInstrument(instrument removeInstrument: Instrument) -> Bool
	{
		if !self.hasInstrument()
		{
			return false
		}
		
		for instrument in self.instruments
		{
			if instrument == removeInstrument
			{
				// TODO: Remove instrument from list
				return true
			}
		}
		
		return false
	}
	
	private func hasInstrument() -> Bool
	{
		return self.instruments != [Instrument.None] || self.instruments.count == 0
	}
}
