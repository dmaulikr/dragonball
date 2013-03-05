//
//  MottoCell.h
//  TaxiDriver
//
//  Created by Thorsten Neff on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MottoCell : UITableViewCell <UITextViewDelegate>
{
    IBOutlet UITextField* txtMotto;
    IBOutlet UILabel* lblMotto;
}

@property (strong) IBOutlet UITextField* txtMotto;
@property (strong) IBOutlet UILabel* lblMotto;

@end
