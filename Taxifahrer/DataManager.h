//
//  DataManager.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property float mapBrightness;
+(DataManager*) getInstance;

-(void) saveMapBrightness:(float)brightness;

@end
