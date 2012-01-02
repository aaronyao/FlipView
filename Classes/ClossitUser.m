//
//  ClossitUser.m
//  FlipView
//
//  Created by Taimur Shah on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClossitUser.h"
#import "SBJson.h"
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

-(NSString*)Image
{
    NSString* filename = [self md5:[JSON objectForKey:@"avatar"]];
    filename = [filename stringByAppendingString:@".png"];
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *pngFilePath = [NSString stringWithFormat:@"%@/%@",docDir, filename];
    
    
    if([[NSFileManager defaultManager] fileExistsAtPath:pngFilePath])
        return pngFilePath;
    
    NSURL *url = [NSURL URLWithString:[JSON objectForKey:@"avatar"]];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    
	// If you go to the folder below, you will find those pictures
	NSLog(@"%@",docDir);
    
	NSLog(@"saving png");
	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(img)];
	[data1 writeToFile:pngFilePath atomically:YES];
    
	NSLog(@"saving image done");
    
	imgPath = pngFilePath;
    return pngFilePath;
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5(cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}



@end
