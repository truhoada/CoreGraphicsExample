//
//  ViewRotateRect.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewRotateRect.h"

@implementation ViewRotateRect {
    NSTimer *timer;
    float alpha;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        alpha = 0.0f;
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                  target: self
                                                selector: @selector(refreshView)
                                                userInfo: nil
                                                 repeats: YES];

    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    float x0 = self.bounds.size.width * 0.5f;
    float y0 = self.bounds.size.height * 0.5f - 60;
    
    float width = 100.0f;
    float halfWidth = width * 0.5f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Set stroke width and color
    CGContextSetLineWidth(context, 10);
    CGContextSetRGBStrokeColor(context, 0.2f, 0.2f, 0.2f, 1.0f);

    //Correct rotation
    CGContextRef backupContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(backupContext);

    // Move to the center of the rectangle:
    CGContextTranslateCTM(context, x0, y0);
    // Rotate:
    CGContextRotateCTM(context, alpha);
    alpha += 0.1;
    
    CGRect squareRect = CGRectMake(-halfWidth, -halfWidth, width, width);
    CGContextSetRGBFillColor(context, 1.0f, 1.0f, 0.0f, 1.0f);
    CGContextFillRect(context, squareRect);
    CGContextStrokeRect(context, squareRect);
    
    CGContextRestoreGState(backupContext);
}

- (void) refreshView {
    [self setNeedsDisplay];
}

- (void) cleanUpView
{
    [timer invalidate];
}

@end



















