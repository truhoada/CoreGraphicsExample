//
//  ViewBasicRectangle.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewBasicRectangle.h"

@implementation ViewBasicRectangle



- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    float width = 200.0f;
    // Get handle to current CGContext
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Set stroke width and color
    CGContextSetLineWidth(context, 10); //Độ dày của viền hình vuông
    CGContextSetRGBStrokeColor(context, 0.1f, 0.2f, 0.3f, 1.0f); //Màu viền hình vuông

    // Draw square
    CGRect squareRect = CGRectMake(self.center.x - width/2, self.center.y - width/2, width, width); //Toạ độ hv
    CGContextSetRGBFillColor(context, 0.6f, 0.8f, 0.1f, 1.0f); //Màu bên trong hình vuông
    CGContextFillRect(context, squareRect);
    CGContextStrokeRect(context, squareRect);
}


@end
