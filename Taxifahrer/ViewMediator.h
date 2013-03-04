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
@class TabellenViewController;
@class TabMainViewController;
@class AppDelegate;
@class ProfilViewController;
@class HelligkeitViewController;

@interface ViewMediator : NSObject
{
    AppDelegate* appdelegate;
    
    MapViewController* mapController;
    TabellenViewController* tableController;
    ProfilViewController* profilController;
    
    UINavigationController* navMapController;
    UINavigationController* navTableController;
    UINavigationController* navProfilController;
    
    TabMainViewController* tabMainController;
}

@property (nonatomic,assign) AppDelegate* appdelegate;
@property (nonatomic,retain) TabMainViewController* tabMainController;
@property (nonatomic,retain) HelligkeitViewController* HelligkeitController;

@property (nonatomic,retain) UINavigationController* navMapController;
@property (nonatomic,retain) UINavigationController* navTableController;
@property (nonatomic,retain) UINavigationController* navProfilController;

@property (nonatomic,retain) UINavigationController* navController;

@property (nonatomic,retain) ViewController* Registrieren;
@property (nonatomic,retain) MapViewController* Karte;
@property (nonatomic,retain) LoginScreenViewController* Login;
@property (nonatomic,retain) PasswortZuruecksetzenViewController* PW;
@property (nonatomic,retain) AnfangViewController* Anfang;
@property (nonatomic,retain) VorRegiViewController* VorRegi;
@property (nonatomic,retain) AGBViewController* AGB;
@property (nonatomic,retain) ProfilViewController* Profil;

+(ViewMediator*) getInstance;
-(id) init;

//von Login zu ...
-(void) vonLoginZuRegi;
-(void) vonLoginZuMap;
-(void) vonLoginZuVorRegi;
-(void) vonLoginZuPW;

//von Regi zu ...
-(void) vonRegiZuMap;
-(void) vonVorRegiZuAGB;
-(void) vonRegiZuLogin;

//von PW zu ...
-(void) vonPWZuLogin;

//von Map zu ...
-(void) VonMapzuRegi;

//von Anfang zu ...
-(void) vonAnfangZuMap;
-(void) vonAnfangZuLogin;

//von AGB zu ...
-(void) vonAGBZuLogin;
-(void) vonAGBZuVorRegi;
-(void) vonAGBZuRegi;

//von VorRegi zu ...
-(void) vonVorRegiZuRegi;

//TabMainViewController
-(void) showMapView;
-(void) showTableView;

-(void) showProfilView;
-(void) vonTabellezuKarte;


@end
