//
//  BitmapNumbers.h
//  zahlen2
//
//  Created by Thorsten Neff on 12/10/12.
//  Copyright (c) 2012 talex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BitmapNumbers : NSObject
{    
    NSMutableDictionary* dicYellowNumbers;
    NSMutableDictionary* dicWhiteNumbers;
}


+(BitmapNumbers*) getInstance;
-(id) init;

-(int) getPixelWidthOfText:(NSString*) text;
-(UIImage*) getYellowNumber:(NSString*) number;
-(UIImage*) getWhiteNumber:(NSString*) number;

-(UIImage*) convertStringToImage:(NSString*) s;

@end
