//
//  ViewMediator.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ViewMediator.h"
#import "LoginScreenViewController.h"
#import "MapViewController.h"
#import "ViewController.h"
#import "PasswortZuruecksetzenViewController.h"
#import "AnfangViewController.h"
#import "VorRegiViewController.h"
#import "AGBViewController.h"

static ViewMediator* mediator = nil;

@implementation ViewMediator
@synthesize Registrieren;
@synthesize Karte;
@synthesize Login;
@synthesize PW;
@synthesize Anfang;
@synthesize VorRegi;
@synthesize AGB;
@synthesize navController;

+(ViewMediator*) getInstance {
    if (mediator == nil) {
        mediator = [[ViewMediator alloc] init];
    }
    return mediator;
}

-(id) init {
    self = [super init];
    if (self) {
        self.Registrieren = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        self.Karte = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        self.Login = [[LoginScreenViewController alloc] initWithNibName:@"LoginScreenViewController" bundle:nil];
        self.PW = [[PasswortZuruecksetzenViewController alloc] initWithNibName:@"PasswortZuruecksetzenViewController" bundle:nil];
        self.Anfang = [[AnfangViewController alloc] initWithNibName:@"AnfangViewController" bundle:nil];
        self.VorRegi = [[VorRegiViewController alloc] initWithNibName:@"VorRegiViewController" bundle:nil];
        self.AGB = [[AGBViewController alloc] initWithNibName:@"AGBViewController" bundle:nil];
        
        navController = [[UINavigationController alloc] initWithRootViewController:self.Anfang];
    }
    return self;
}

-(void) vonLoginZuRegi
{
    [self.Login.navigationController pushViewController:self.Registrieren animated:YES];    
}

-(void) vonLoginZuMap
{
    [self.Login.navigationController pushViewController:self.Karte animated:YES];
}

-(void) vonRegiZuMap
{
    [self.Registrieren.navigationController pushViewController:self.Karte animated:YES];
}

-(void) vonLoginZuPW
{
    [self.Login.navigationController pushViewController:self.PW animated:YES];
}

-(void) vonAnfangZuMap
{
    [self.Anfang.navigationController pushViewController:self.Karte animated:YES];
}

-(void) vonAnfangZuLogin
{
    [self.Anfang.navigationController pushViewController:self.Login animated:YES];
}

-(void) vonLoginZuVorRegi
{
    [self.Login.navigationController pushViewController:self.VorRegi animated:YES];
}

-(void) vonVorRegiZuAGB
{
    [self.VorRegi.navigationController pushViewController:self.AGB animated:YES];
}

-(void) vonAGBZuRegi
{
    [self.AGB.navigationController pushViewController:self.Registrieren animated:YES];
}

-(void) vonVorRegiZuRegi
{
    [self.VorRegi.navigationController pushViewController:self.Registrieren animated:YES];
}

-(void) vonAGBZuLogin
{
    [self.AGB.navigationController pushViewController:self.Login animated:YES];
}

-(void) vonAGBZuVorRegi
{
    [self.AGB.navigationController pushViewController:self.VorRegi animated:YES];
}

@end
