//
//  Clothing.m
//  FlipView
//
//  Created by Taimur Shah on 12/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Clothing.h"
#import "SBJson.h"
#import "Session.h"


@implementation Clothing
@synthesize JSON;

-(Clothing *) initFromString:(NSString *)json
{
    if(self = [super init])
    {
        self.JSON = [[json JSONValue] copy];
    }
    
    return self;
}

-(Clothing*) initFromDictionary:(NSDictionary *)json
{
    if(self = [super init])
    {
        self.JSON = [json copy];
    }
    
    return self;
}

-(NSString*) Name
{
    return [self.JSON objectForKey:@"name"];
}

-(NSString*) Description
{
    return [JSON objectForKey:@"description"];
}

-(NSString*) Image: (int) height width:(int) width
{
    return [Session getImage:[NSString stringWithFormat:@"http://api.clossit.com/api/Thumbnail.aspx?src=%@&width=%d&height=%d", [JSON objectForKey:@"image"], width, height]];
}

-(NSString *) Store
{
    return [JSON objectForKey:@"store"];
}

-(NSString*) Gender
{
    return [JSON objectForKey:@"gender"];
}

-(NSString*) Id
{
    return [JSON objectForKey:@"id"];
}

-(NSString *)URL
{
    return [JSON objectForKey:@"url"];
}

-(NSString*) dateIndexed
{
    return [JSON objectForKey:@"added"];
}



@end
