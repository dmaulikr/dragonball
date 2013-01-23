//
//  ViewMediator.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginScreenViewController;
@class ViewController;
@class MapViewController;

@interface ViewMediator : NSObject
{}

@property (nonatomic,retain) UINavigationController* navController;

@property (nonatomic,retain) ViewController* Registrieren;
@property (nonatomic,retain) MapViewController* Karte;
@property (nonatomic,retain) LoginScreenViewController* Login;

+(ViewMediator*) getInstance;
-(id) init;

-(void) vonLoginZuRegi;
-(void) vonLoginZuMap;

@end