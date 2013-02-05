//
//  JobButton.h
//  kartemitbild
//
//  Created by Dennis Brunne on 02.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJob;

@interface JobButton : UIButton

@property (nonatomic,retain) CJob* Job;

@end
