//
//  ViewController.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ViewController.h"
#import "UserdataManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) speichern:(id)sender
{
    NSLog(@"Registrier Button wurde aufgerufen!");
    UserdataManager* um = [UserdataManager getInstance];
    um.username =  txtUsername.text;
    um.password = txtPassword.text;
    um.phone = txtPhone.text;
    
    [um saveData];
}


- (void)dealloc {
   
    [super dealloc];
}
@end
