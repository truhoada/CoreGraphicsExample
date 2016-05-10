//
//  ViewFillPath.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewFillPath.h"

@implementation ViewFillPath

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    
    //Path 0:
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 80, 80, 30, 0, M_PI, true);
    CGPathAddArc(path, NULL, 80, 80, 50, 0, M_PI_2, true); //Vẽ từ điểm cuối đến điểm đầu theo kim đồng hồ (điểm cuối là điểm hiện tại)
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //Path1
    CGMutablePathRef path1= CGPathCreateMutable();
    CGPathAddArc(path1, NULL, 240, 80, 30, M_PI*2, 0, true);
    CGPathAddArc(path1, NULL, 240, 80, 50, M_PI*2, 0, true);
    CGContextAddPath(context, path1);
    CGContextDrawPath(context, kCGPathFill);
    
    
    //Path2
    CGMutablePathRef path2= CGPathCreateMutable();
    CGPathAddArc(path2, NULL, 80, 200, 30, M_PI*2, 0, true);
    CGPathAddArc(path2, NULL, 80, 200, 50, M_PI*2, 0, true);
    CGContextAddPath(context, path2);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //Path3
    CGMutablePathRef path3= CGPathCreateMutable();
    CGPathAddArc(path3, NULL, 240, 200, 30, M_PI*2, 0, true);
    CGPathAddArc(path3, NULL, 240, 200, 50, M_PI*2, 0, true);
    CGContextAddPath(context, path3);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(path);
    CGPathRelease(path1);
    CGPathRelease(path2);
    CGPathRelease(path3);
    
}





@end






























