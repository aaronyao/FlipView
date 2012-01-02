//
//  ClossitUser.m
//  FlipView
//
//  Created by Taimur Shah on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClossitUser.h"
#import "SBJson.h"
#import "Session.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16

@implementation ClossitUser

@synthesize JSON, imgPath;

-(ClossitUser*) initFromString:(NSString *)json
{
    if(self=[super init])
    {
        self.JSON = [[json JSONValue] copy];
    }
    
    return self;
}

-(ClossitUser*) initFromDictionary:(NSDictionary *)json
{
    if(self = [super init])
    {
        JSON = [json copy];
    }
    return self;
}

-(NSString*) ID
{
    return [JSON objectForKey:@"id"];
}

-(NSString*)Name
{
    return [JSON objectForKey:@"name"];
}

-(NSString*)FirstName
{
    return [JSON objectForKey:@"first"];
}

-(NSString*)LastName
{
    return [JSON objectForKey:@"last"];
}

-(NSURL*)Page
{
    return [NSURL URLWithString:[@"http://www.clossit.com" stringByAppendingString:[JSON objectForKey:@"page"]]]; 
}

-(NSString*)Image: (NSString*) height width:(NSString *)width
{
     return [Session getImage:[NSString stringWithFormat:@"http://api.clossit.com/api/Thumbnail.aspx?src=%@&width=%@&height=%@", [JSON objectForKey:@"image"], width, height]];
}





@end
