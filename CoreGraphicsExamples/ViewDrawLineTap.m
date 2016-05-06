//
//  ViewDrawLineTap.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewDrawLineTap.h"

@implementation ViewDrawLineTap {
    NSInteger lineDrawState;
    CGMutablePathRef path;
    CGPoint startPoint;
    CGPoint endPoint;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
        lineDrawState = -1;
        path = CGPathCreateMutable();
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)handleTap: (UIGestureRecognizer*)tap {
    if (tap.state == UIGestureRecognizerStateRecognized) {
        switch (lineDrawState) {
            case -1:
                startPoint = [tap locationInView:self];
                CGRect circleRect = CGRectMake(startPoint.x-5, startPoint.y-5, 10, 10);
                CGPathAddEllipseInRect(path, nil, circleRect);
                lineDrawState = 0;
                break;
                
            case 0:
                endPoint = [tap locationInView:self];
                CGRect rectangleRect = CGRectMake(endPoint.x-5, endPoint.y-5, 10, 10);
                CGPathAddRect(path, &CGAffineTransformIdentity, rectangleRect);
                CGPoint line[] = {{startPoint.x, startPoint.y}, {endPoint.x, endPoint.y}};
                CGPathAddLines(path, &CGAffineTransformIdentity, line, 2);
                lineDrawState = -1;
                break;
            default:
                break;
        }
    }
    [self setNeedsDisplay];
}


- (void)customizeViewController:(UIViewController *)viewController {
    [super customizeViewController:viewController];
    UIBarButtonItem *clearButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clearAll)];
    viewController.navigationItem.rightBarButtonItem = clearButtonItem;
}

- (void)clearAll {
    CGPathRelease(path);
    path = CGPathCreateMutable();
    [self setNeedsDisplay];
}


@end























