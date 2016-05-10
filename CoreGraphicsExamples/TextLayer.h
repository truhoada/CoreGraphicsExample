//
//  TextLayer.h
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/9/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface TextLayer : CATextLayer

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, strong) UIFont *textFont;

- (instancetype)initAt:(CGPoint)center withFont:(UIFont*)font andText:(NSString*)text;

@end
