//
//  ClossitUser.h
//  FlipView
//
//  Created by Taimur Shah on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClossitUser : NSObject
{
    NSDictionary* JSON;
    NSString* imgPath;
}

-(ClossitUser*) initFromString:(NSString*) json;
-(ClossitUser*) initFromDictionary:(NSDictionary*) json;

-(NSString*) ID;
-(NSString*) Name;
-(NSString*) FirstName;
-(NSString*) LastName;
-(NSURL*) Page;
-(NSString*) Image:(int) height width:(int)width;

@property (nonatomic, strong) NSDictionary* JSON;
@property (strong) NSString* imgPath;
@end
