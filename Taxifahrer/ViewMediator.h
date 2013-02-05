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
@class PasswortZuruecksetzenViewController;
@class AnfangViewController;
@class VorRegiViewController;
@class AGBViewController;

@interface ViewMediator : NSObject
{}

@property (nonatomic,retain) UINavigationController* navController;

@property (nonatomic,retain) ViewController* Registrieren;
@property (nonatomic,retain) MapViewController* Karte;
@property (nonatomic,retain) LoginScreenViewController* Login;
@property (nonatomic,retain) PasswortZuruecksetzenViewController* PW;
@property (nonatomic,retain) AnfangViewController* Anfang;
@property (nonatomic,retain) VorRegiViewController* VorRegi;
@property (nonatomic,retain) AGBViewController* AGB;

+(ViewMediator*) getInstance;
-(id) init;

-(void) vonLoginZuRegi;
-(void) vonLoginZuMap;
-(void) vonRegiZuMap;
-(void) vonLoginZuPW;
-(void) vonAnfangZuMap;
-(void) vonAnfangZuLogin;

-(void) vonLoginZuVorRegi;
-(void) vonVorRegiZuAGB;
-(void) vonAGBZuRegi;
-(void) vonVorRegiZuRegi;
-(void) vonAGBZuLogin;
-(void) vonAGBZuVorRegi;

@end
