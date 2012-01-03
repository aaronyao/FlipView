/*
 This module is licensed under the MIT license.
 
 Copyright (C) 2011 by raw engineering
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
//
//  FullScreenView.m
//  FlipView
//
//  Created by Reefaq Mohammed on 16/07/11.
 
//
#import "FullScreenView.h"
#import "ClothingModel.h"
#import "Clothing.h"

@implementation FullScreenView

@synthesize clothingModel,viewToOverLap,fullScreenBG;

-(id)initWithModel:(ClothingModel*)model {
	if (self = [super init]) {
		clothingModel = model;
		
		[self setBackgroundColor:RGBCOLOR(243,243,243)];
		
		contentView = [[UIView alloc] init];
		[contentView setBackgroundColor:RGBCOLOR(243,243,243)];
		
		clothingImageView = [[UIImageView alloc] init];
		[clothingImageView setBackgroundColor:[UIColor clearColor]];
		[clothingImageView setFrame:CGRectMake(10, 10, 130, 130)];
		[clothingImageView setImage:[clothingModel.clothing Image:50 :50]];
		[contentView addSubview:clothingImageView];
		
		clothingNameLabel = [[UILabel alloc] init];
		clothingNameLabel.font =[UIFont fontWithName:@"Helvetica" size:25];
		[clothingNameLabel setTextColor:RGBCOLOR(2,90,177)];
		[clothingNameLabel setBackgroundColor:[UIColor clearColor]];
		[clothingNameLabel setText:[NSString stringWithFormat:@"%@",clothingModel.clothing.Name]];
		[clothingNameLabel setFrame:CGRectMake(clothingImageView.frame.origin.x + clothingImageView.frame.size.width + 10, 5, 0, 0)];
		[contentView addSubview:clothingNameLabel];
		
		storeNameLabel = [[UILabel alloc] init];
		[storeNameLabel setText:clothingModel.clothing.Store];
		storeNameLabel.font =[UIFont fontWithName:@"Helvetica" size:12];
		[storeNameLabel setTextColor:RGBCOLOR(111,111,111)];
		[storeNameLabel setBackgroundColor:[UIColor clearColor]];
		[storeNameLabel setFrame:CGRectMake(clothingNameLabel.frame.origin.x, clothingNameLabel.frame.origin.y, 0, 0)];
		storeNameLabel.alpha = 0;
		[contentView addSubview:storeNameLabel];
		
		scrollView = [[UIScrollView alloc] init];
		[scrollView setBackgroundColor:[UIColor clearColor]];
		[scrollView setFrame:CGRectMake(10, clothingImageView.frame.origin.y + clothingImageView.frame.size.height + 10, 0, 0)];
		[contentView addSubview:scrollView];
		
		descriptionLabel = [[UILabel alloc] init];
		descriptionLabel.numberOfLines = 0;	
		descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:22];		
		descriptionLabel.textColor =  RGBCOLOR(33,33,33);
		descriptionLabel.highlightedTextColor = RGBCOLOR(33,33,33);
		[descriptionLabel setBackgroundColor:[UIColor clearColor]];
		descriptionLabel.alpha = 0;	
		[scrollView addSubview:descriptionLabel];
		
		
		closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
		UIImageView* closeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"close-popup.png"]];
		[closeImage setFrame:CGRectMake(6, 6, 17, 17)];
		[closeButton addSubview:closeImage];
		[closeButton addTarget:self action:@selector(closeFullScreenView:) forControlEvents:UIControlEventTouchUpInside];
		[closeButton sizeToFit];
		closeButton.alpha = 0;
		[contentView addSubview:closeButton];
		

		[self addSubview:contentView];

	}
	return self;
}

- (void)reAdjustLayout{
	
		[contentView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		CGSize contentViewArea = CGSizeMake(contentView.frame.size.width, contentView.frame.size.height);
		
		//[userImageView setFrame:CGRectMake(10, 10, 130, 130)];
	
		[clothingNameLabel sizeToFit];
		[clothingNameLabel setFrame:CGRectMake(clothingImageView.frame.origin.x + clothingImageView.frame.size.width + 10, 5, (contentViewArea.width - (clothingImageView.frame.size.width + 10)) - 30, clothingNameLabel.frame.size.height)];

		[storeNameLabel sizeToFit];
		[storeNameLabel setFrame:CGRectMake(clothingNameLabel.frame.origin.x, clothingNameLabel.frame.origin.y + clothingNameLabel.frame.size.height, storeNameLabel.frame.size.width, storeNameLabel.frame.size.height)];

		[closeButton setFrame:CGRectMake(contentViewArea.width - 30, 0, 30, 30)];
	
		[scrollView setFrame:CGRectMake(10, clothingImageView.frame.origin.y + clothingImageView.frame.size.height + 10, contentViewArea.width-20, contentViewArea.height - (clothingImageView.frame.origin.y + clothingImageView.frame.size.height + 10))];

		///////////////////////////////////////////////////////////////
		[descriptionLabel setText:clothingModel.clothing.Description];
		descriptionLabel.numberOfLines = 0;
		[descriptionLabel sizeToFit];
		[descriptionLabel setFrame:CGRectMake(0, 0, scrollView.frame.size.width,descriptionLabel.frame.size.height)];

		[scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height)];
	
}


-(void)closeFullScreenView:(id)sender {
   viewToOverLap.alpha = 1;
   [self setBackgroundColor:[UIColor whiteColor]];
   [sender removeFromSuperview];
   [UIView beginAnimations:@"CLOSEFULLSCREEN" context:NULL];
   [UIView setAnimationDuration:0.30];
   [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:nil cache:YES];
   [self setFrame:viewToOverLap.originalRect];
	fullScreenBG.alpha = 0;
   for (UIView* subview in [self subviews]) {
	   subview.alpha = 0;
   }	
   [UIView setAnimationDelegate:self];
   [UIView setAnimationDidStopSelector:@selector(animationEnd:finished:context:)];	
   [UIView commitAnimations];
}

- (void)animationEnd:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {
   if ([animationID isEqualToString:@"CLOSEFULLSCREEN"]) {
	   self.alpha = 0;
	   [self removeFromSuperview];
	   [[FlipViewAppDelegate instance] closeFullScreen];
   }
}

-(void)showFields {
	[self reAdjustLayout]; // i just need this dont know why ... but will look at this later and fix it 
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.20];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:nil cache:NO];
	storeNameLabel.alpha = 1;
	closeButton.alpha = 1;
	descriptionLabel.alpha = 1;
	[UIView commitAnimations];
}


-(void) dealloc {
	closeButton=nil;
	clothingImageView=nil;
	clothingNameLabel=nil;
	storeNameLabel=nil;
	descriptionLabel=nil;
	scrollView=nil;
	contentView=nil;
}

@end
