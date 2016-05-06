//
//  ViewCubicBezierCurve.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewCubicBezierCurve.h"
#import "ViewControlPoint.h"

@implementation ViewCubicBezierCurve {
    ViewControlPoint *startPoint;
    ViewControlPoint *controlPointA;
    ViewControlPoint *controlPointB;
    ViewControlPoint *endPoint;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        startPoint = [[ViewControlPoint alloc] initAtPoint:CGPointMake(50, 250)];
        controlPointA = [[ViewControlPoint alloc] initAtPoint:CGPointMake(80, 100)];
        controlPointB = [[ViewControlPoint alloc] initAtPoint:CGPointMake(200, 150)];
        endPoint = [[ViewControlPoint alloc] initAtPoint:CGPointMake(250, 350)];
        
        [self addSubview:startPoint];
        [self addSubview:controlPointA];
        [self addSubview:controlPointB];
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
    CGMutablePathRef linesPath = CGPathCreateMutable();
    CGPathMoveToPoint(linesPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddLineToPoint(linesPath, NULL, controlPointA.origin.x, controlPointA.origin.y);
    
    CGPathMoveToPoint(linesPath, NULL, endPoint.origin.x, endPoint.origin.y);
    CGPathAddLineToPoint(linesPath, NULL, controlPointB.origin.x, controlPointB.origin.y);
    
    CGContextAddPath(context, linesPath);
    CGContextDrawPath(context, kCGPathStroke);

    //Bezier Path
    CGMutablePathRef bezierPath = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 4.0);
    
    CGPathMoveToPoint(bezierPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddCurveToPoint(bezierPath, NULL, controlPointA.origin.x, controlPointA.origin.y, controlPointB.origin.x, controlPointB.origin.y, endPoint.origin.x,  endPoint.origin.y);
    
    CGContextAddPath(context, bezierPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(linesPath);
    CGPathRelease(bezierPath);

    
}


@end




























