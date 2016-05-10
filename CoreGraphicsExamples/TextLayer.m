//
//  TextLayer.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/9/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "TextLayer.h"

@implementation TextLayer

- (instancetype)initAt:(CGPoint)center withFont:(UIFont *)font andText:(NSString *)text {
    if (self = [super init]) {
        _center = center;
        _textFont = font;
        
        CGFontRef fontRef = CGFontCreateWithFontName((__bridge CFStringRef)_textFont.fontName);
        self.font = fontRef;
        self.fontSize = _textFont.pointSize;
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGFloat components[] = {0, 0, 0, 0};
        CGColorRef transparentColor = CGColorCreate(colorspace, components);
        self.backgroundColor = transparentColor;
        self.alignmentMode = @"center";
        self.wrapped = NO;
        
        [self setString:text];
        
        CGColorRelease(transparentColor);
        CGColorSpaceRelease(colorspace);
        CGFontRelease(fontRef);
    }
    return self;

}

- (void) setString:(id)string {
    [super setString:string];
//    CGSize labelSize = [string sizeWithFont:_textFont];
    
    CGSize size = [string sizeWithAttributes:
                   @{NSFontAttributeName: [UIFont systemFontOfSize:40.0]}];
    
    // Values are fractional -- you should take the ceilf to get equivalent values
    CGSize adjustedSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    self.frame = CGRectMake(_center.x- adjustedSize.width/2, _center.y - adjustedSize.height/2, adjustedSize.width, adjustedSize.height);
    
}

@end






