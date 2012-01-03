//
//  Clothing.h
//  FlipView
//
//  Created by Taimur Shah on 12/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Clothing : NSObject
{
    NSDictionary* JSON;
}

- (Clothing *) initFromString:(NSString*) json;
- (Clothing *) initFromDictionary: (NSDictionary*) json;

- (NSString*) Name;
- (NSString*) URL;
- (NSString*) Description;
- (UIImage*) Image: (int)width :(int)height;
- (NSString*) Id;
- (NSString*) Store;
- (NSString*) Gender;
- (NSString*) dateIndexed;
//- (NSString* ) loadImage:(NSString *) url;


@property (strong) NSDictionary* JSON;

@end
