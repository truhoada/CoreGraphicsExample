//
//  ViewFillColor.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewFillColor.h"

CGColorRef RandomColor() {
    CGFloat red = (arc4random() % 256 / 255.0f);
    CGFloat green = (arc4random() % 256) / 255.0f;
    CGFloat blue = (arc4random() % 256) / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
}

@implementation ViewFillColor {
    NSTimer *timer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                               selector:@selector(refreshView)
                                               userInfo:nil repeats:YES];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, RandomColor());
    CGContextFillRect(context, rect);
}

- (void)refreshView {
    [self setNeedsDisplay];
}

- (void)cleanUpView {
    [timer invalidate];
}



@end

















