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
#import "UIImageExtras.h"


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

-(UIImage*) Image:(int)width :(int)height {
    NSString* path = [Session getImage:[JSON objectForKey:@"image"]];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:path];
    return [image resize:CGSizeMake(width, height)];
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
