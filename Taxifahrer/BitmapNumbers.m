//
//  BitmapNumbers.m
//  zahlen2
//
//  Created by Thorsten Neff on 12/10/12.
//  Copyright (c) 2012 talex. All rights reserved.
//

#import "BitmapNumbers.h"

@implementation BitmapNumbers
static BitmapNumbers* instance = nil;

+(BitmapNumbers*) getInstance
{
    if (instance == nil)
    {
        instance = [[BitmapNumbers alloc] init];
    }
    return instance;
}

-(id) init
{
    self = [super init];
    if (self != nil)
    {
        // Zahlen in Dictionaries laden
        dicWhiteNumbers = [[NSMutableDictionary alloc] init];
        dicWhiteNumbers = [[NSMutableDictionary alloc] init];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_0g.png"] forKey:@"0"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_1g.png"] forKey:@"1"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_2g.png"] forKey:@"2"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_3g.png"] forKey:@"3"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_4g.png"] forKey:@"4"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_5g.png"] forKey:@"5"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_6g.png"] forKey:@"6"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_7g.png"] forKey:@"7"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_8g.png"] forKey:@"8"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_9g.png"] forKey:@"9"];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_decimalg.png"] forKey:@"."];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_decimalg.png"] forKey:@","];
        [dicWhiteNumbers setObject:[UIImage imageNamed:@"sm_timea.png"] forKey:@":"];
        
        dicYellowNumbers = [[NSMutableDictionary alloc] init];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_0g.png"] forKey:@"0"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_1g.png"] forKey:@"1"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_2g.png"] forKey:@"2"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_3g.png"] forKey:@"3"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_4g.png"] forKey:@"4"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_5g.png"] forKey:@"5"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_6g.png"] forKey:@"6"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_7g.png"] forKey:@"7"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_8g.png"] forKey:@"8"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_9g.png"] forKey:@"9"];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_decimalg.png"] forKey:@"."];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_decimalg.png"] forKey:@","];
        [dicYellowNumbers setObject:[UIImage imageNamed:@"sm_timea.png"] forKey:@":"];
    }
    return self;
}

-(int) getPixelWidthOfText:(NSString*)text
{
    NSRange textRange;
    textRange =[[text lowercaseString] rangeOfString:[@"km" lowercaseString]];
    
    BOOL withKM = NO;
    if(textRange.location != NSNotFound)
    {
        text = [text substringToIndex:textRange.location];
        withKM = YES;
    }
    
    int pixellength = 0;
    for (int i = 0; i < text.length;i++)
    {
        char c = [text characterAtIndex:i];
        NSString* s = [[NSString alloc] initWithFormat:@"%c",c];
        if (i%2 == 0) {
            UIImage* image = [self getYellowNumber:s];
            int w = image.size.width;
            pixellength+=w;
        } else {
            UIImage* image = [self getWhiteNumber:s];
            int w = image.size.width;
            pixellength+=w;
        }
    }
    
    if (withKM == YES)
        pixellength = pixellength + 75 +10; // 75=km-Image, 10 = margin
    
    return pixellength;
}

-(UIImage*) getYellowNumber:(NSString*) number
{
    return [dicYellowNumbers objectForKey:number];
}

-(UIImage*) getWhiteNumber:(NSString*) number
{
    return [dicWhiteNumbers objectForKey:number];
}

-(UIImage*) convertStringToImage:(NSString*) s
{
    NSLog(@"%@",s);
    
    int totalheight = 90;
    int letterheight = 72;
    int colonoffset = 5;
    int leftmargin = -3;
    int kmoffset = 7;
    
    NSRange textRange;
    textRange =[[s lowercaseString] rangeOfString:[@"km" lowercaseString]];
    
    BOOL withKM = NO;
    if(textRange.location != NSNotFound)
    {
        s = [s substringToIndex:textRange.location];
        withKM = YES;
    }
    
    if (s != nil)
    {
        int pixellength = [self getPixelWidthOfText:s];
        if (withKM == YES) {
            pixellength+=85;
        }
            
        float width = (float) pixellength;
        float index = 0;
        int zaehler = 0;
        UIGraphicsBeginImageContext(CGSizeMake(width, totalheight));
        for (int i = 0; i < [s length];i++)
        {
            char c = [s characterAtIndex:i];
            NSString* s = [[NSString alloc] initWithFormat:@"%c",c];
            UIImage* image = nil;
            if (zaehler%2 == 0) {
                image = [self getYellowNumber:s];
            } else {
                image = [self getWhiteNumber:s];
            }
            
            if (image != nil) {
                int w = (int) image.size.width;
                int ypos = 0;
                if (c == ':') {
                    ypos = letterheight/2 + colonoffset - image.size.height/2;
                } else if (c == ',' || c == '.') {
                    ypos = totalheight - (2*image.size.height);
                    index-=5;
                }

                [image drawAtPoint:CGPointMake(index, ypos)];
                index+=w;
                index+=leftmargin;
                
                if (c != ':' && c != ',' && c != '.')
                {
                    zaehler++;
                }
            }
        }
        
        if (withKM)
        {
            UIImage* image = [UIImage imageNamed:@"sm_kmg2.png"];
            [image drawAtPoint:CGPointMake(index+10, kmoffset)];
        }
        
        // assign context to UIImage
        UIImage *outputImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // end context
        UIGraphicsEndImageContext();
        return outputImg;
    }
    return nil;
}

@end


