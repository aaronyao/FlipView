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
- (NSString *) Image;
- (NSString*) Id;
- (NSString*) Store;
- (NSString *) md5:(NSString *) input;


@property (retain) NSDictionary* JSON;

@end
