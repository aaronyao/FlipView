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
//  TitleAndTextView.m
//  FlipView
//
//  Created by Reefaq Mohammed on 16/07/11.
 
//

#import "TitleAndTextView.h"
#import "ClothingModel.h"
#import "Clothing.h"

@implementation TitleAndTextView

@synthesize clothingModel;

- (id) initWithClothingModel:(ClothingModel*)clothingmodel{
	if (self = [super init]) {
		self.clothingModel = clothingmodel;
		[self initializeFields];
		
		UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
		[self addGestureRecognizer:tapRecognizer];

	}
	return self;
}

- (void)reAdjustLayout{

	[contentView setFrame:CGRectMake(1, 1, self.frame.size.width-2, self.frame.size.height - 2)];
	
	CGSize contentViewArea = CGSizeMake((contentView.frame.size.width - 20), (contentView.frame.size.height-30));
    
    float ratio = clothingImageView.image.size.height/clothingImageView.image.size.width;
    int width = contentView.frame.size.width;
    int height = contentView.frame.size.height;
	clothingImageView.image = [UIImage imageWithContentsOfFile:[clothingModel.clothing Image:height width:width]];
    [clothingImageView setFrame:CGRectMake(0, 0, width, height)];
    
    /*
    if(height < contentView.frame.size.height) {
        ratio = userImageView.image.size.height/userImageView.image.size.width;
        int width = contentView.frame.size.width;
        [userImageView setFrame:CGRectMake(0, 0, width, contentView.frame.size.height*ratio)];
    }
    */
	[clothingNameLabel sizeToFit];
	[clothingNameLabel setFrame:CGRectMake(clothingImageView.frame.origin.x + clothingImageView.frame.size.width + 10, 5, (contentViewArea.width - (clothingImageView.frame.size.width + 10)), clothingNameLabel.frame.size.height)];
	[storeNameLabel sizeToFit];
	[storeNameLabel setFrame:CGRectMake(clothingNameLabel.frame.origin.x, clothingNameLabel.frame.origin.y + clothingNameLabel.frame.size.height, storeNameLabel.frame.size.width, storeNameLabel.frame.size.height)];

	
	[descriptionLabel setFrame:CGRectMake(clothingImageView.frame.origin.x ,(clothingImageView.frame.origin.y + clothingImageView.frame.size.height), contentViewArea.width, contentViewArea.height - (clothingImageView.frame.origin.y + clothingImageView.frame.size.height))];	
		
		
	[descriptionLabel setText:clothingModel.clothing.Description];
	descriptionLabel.contentMode = UITextAlignmentLeft;
		
//		float widthOffset = (messageLabel.frame.size.width - textSize.width)/ 2;
//		float heightOffset = (messageLabel.frame.size.height - textSize.height)/2;
		//[messageLabel setContentInset:UIEdgeInsetsMake(heightOffset, widthOffset, heightOffset, widthOffset)];

    

}

- (void) initializeFields {
	contentView = [[UIView alloc] init];
	[contentView setBackgroundColor:[UIColor whiteColor]];
     contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

	clothingImageView = [[UIImageView alloc] init];
	[clothingImageView setFrame:CGRectMake(0, 0, self.frame.size.width, 500)];
	[contentView addSubview:clothingImageView];
	
	[self addSubview:contentView];
	
	[self reAdjustLayout];
}

-(void)tapped:(UITapGestureRecognizer *)recognizer {
	[[FlipViewAppDelegate instance] showViewInFullScreen:self withModel:self.clothingModel];
}


-(void) setFrame:(CGRect)rect {
		self.originalRect = rect;
		[super setFrame:rect];
}



@end
