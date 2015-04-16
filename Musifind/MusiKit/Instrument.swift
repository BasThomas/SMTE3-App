//
//  Instrument.swift
//  Musifind
//
//  Created by Bas on 19/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit

/**
	Enum of available instruments.

	- Drums: Experience with drums.
	- Guitar: Experience with the guitar.
	- Piano: Experience with the piano.
	- Trumpet: Experience with the trumpet.
	- Voice: Experience with singing.

	- None: Specifies "no instrument"
*/
public enum Instrument: String
{
	case Drums = "drums"
	case Guitar = "guitar"
	case Piano = "piano"
	case Trumpet = "trumpet"
	case Voice = "voice"
	
	case None = "none"
}