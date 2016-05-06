//
//  ViewQuadraticBezierCurve.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewQuadraticBezierCurve.h"
#import "ViewControlPoint.h"

@implementation ViewQuadraticBezierCurve {
    ViewControlPoint *startPoint;
    ViewControlPoint *midPoint;
    ViewControlPoint *endPoint;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        startPoint = [[ViewControlPoint alloc] initAtPoint:CGPointMake(50, 220)];
        midPoint = [[ViewControlPoint alloc] initAtPoint:CGPointMake(100, 60)];
        endPoint = [[ViewControlPoint alloc] initAtPoint:CGPointMake(280, 260)];
    
        [self addSubview:startPoint];
        [self addSubview:midPoint];
        [self addSubview:endPoint];

    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    // Get handle to current CGContext
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 2.0);

    //Two lines Path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddLineToPoint(path, NULL, midPoint.origin.x, midPoint.origin.y);
    CGPathAddLineToPoint(path, NULL, endPoint.origin.x, endPoint.origin.y);
    
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);

    //Bezier Path
    CGMutablePathRef bezierPath = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 4.0);
    
    CGPathMoveToPoint(bezierPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddCurveToPoint(bezierPath, NULL, midPoint.origin.x, midPoint.origin.y, midPoint.origin.x, midPoint.origin.y, endPoint.origin.x,  endPoint.origin.y);
    
    CGContextAddPath(context, bezierPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(path);
    CGPathRelease(bezierPath);

}


@end




















