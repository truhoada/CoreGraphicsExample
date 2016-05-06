//
//  ViewControlPoint.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewControlPoint.h"
#define POINT_RADIUS 15

@implementation ViewControlPoint

- (instancetype)initAtPoint:(CGPoint)point {
    CGRect rect = CGRectMake(point.x-POINT_RADIUS, point.y-POINT_RADIUS, POINT_RADIUS*2, POINT_RADIUS*2);
    self.origin = point;
    if (self = [super initWithFrame:rect]) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panControlPoint:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.5, 0.5, 0.5, 0.5};
    CGColorRef graySemiTransparentColor = CGColorCreate(colorSpace, components);
    
    CGContextSetFillColorWithColor(context, graySemiTransparentColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    float lineWidth = 1.0;
    CGContextSetLineWidth(context, lineWidth);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddArc(path, NULL, POINT_RADIUS, POINT_RADIUS, POINT_RADIUS-lineWidth-1, M_PI*2, 0, true);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //Release
    CGPathRelease(path);
    CGColorRelease (graySemiTransparentColor);
    CGColorSpaceRelease(colorSpace);
}


- (void)panControlPoint: (UIPanGestureRecognizer*)pan {
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [pan translationInView:self.superview];
        _origin.x = self.center.x + translation.x;
        _origin.y = self.center.y + translation.y;
        
        [self setCenter:CGPointMake(_origin.x, _origin.y)];
        [pan setTranslation:CGPointZero inView:self.superview];
        [self.superview setNeedsDisplay];
    }
}

@end



















