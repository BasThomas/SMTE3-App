//
//  Extensions.swift
//  Musifind
//
//  Created by Bas on 26/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

/// String extensions
extension String
{
	/**
		Checks if a given email is valid.
		
		:returns: If the email is valid.
	*/
	public func isEmail() -> Bool
	{
		let regex = NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: .CaseInsensitive, error: nil)
		
		return regex?.firstMatchInString(self, options: nil, range: NSMakeRange(0, count(self))) != nil
	}
}

/// NSDate extensions
extension NSDate: Equatable, Comparable
{
	/**
		Checks if the date is today.
		
		:returns: If NSDate is today or not.
	*/
	public func isToday() -> Bool
	{
		return NSCalendar.currentCalendar().isDateInToday(self)
	}
	
	/**
		Checks if the date has passed.
		
		:returns: If the NSDate has passed or not.
	*/
	public func inPast() -> Bool
	{
		return self < NSDate()
	}
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool
{
	return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool
{
	return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}

/// UIColor extensions
extension UIColor
{
	/**
		Returns a color object whose RGB values are 1.0, 0.392, and 0.161 and whose alpha value is 1.0.
		
		:returns: The UIColor object.
	*/
	public class func musifindColor() -> UIColor
	{
		return UIColor(red: 1, green: 0.392, blue: 0.161, alpha: 1)
	}
	
	/**
		Returns a color object whose RGB values are 0.788, 0.788, and 0.808 and whose alpha value is 1.0.
		
		:returns: The UIColor object.
	*/
	public class func searchBarColor() -> UIColor
	{
		return UIColor(red: 0.788, green: 0.788, blue: 0.808, alpha: 1)
	}
}