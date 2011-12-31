//
//  Clothing.m
//  FlipView
//
//  Created by Taimur Shah on 12/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Clothing.h"
#import "SBJson.h"
#define CC_MD5_DIGEST_LENGTH 16

@implementation Clothing
@synthesize JSON;

-(Clothing *) initFromString:(NSString *)json
{
    if(self==[super init])
    {
        self.JSON = [json JSONValue];
    }
    
    return self;
}

-(Clothing*) initFromDictionary:(NSDictionary *)json
{
    if(self == [super init])
    {
        self.JSON = json;
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

-(NSString*) Image
{
    NSURL *url = [NSURL URLWithString:[JSON objectForKey:@"image"]];
    //NSURL *url = [NSURL URLWithString:@"http://img87.imageshack.us/img87/5673/rotatetrans.png"];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    NSString* filename = [self md5:[JSON objectForKey:@"image"]];
    filename = [filename stringByAppendingString:@".png"];
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
	// If you go to the folder below, you will find those pictures
	NSLog(@"%@",docDir);
    
	NSLog(@"saving png");
	NSString *pngFilePath = [NSString stringWithFormat:@"%@/%@",docDir, filename];
	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(img)];
	[data1 writeToFile:pngFilePath atomically:YES];
    
	NSLog(@"saving image done");
    
	//[img release];
    return pngFilePath;
}

-(NSString *) Store
{
    return [JSON objectForKey:@"store"];
}

-(NSString*) Id
{
    return [JSON objectForKey:@"id"];
}

-(NSString *)URL
{
    return [JSON objectForKey:@"url"];
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

@end
