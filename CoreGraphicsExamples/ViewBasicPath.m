//
//  ViewBasicPath.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewBasicPath.h"

@implementation ViewBasicPath


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //---------Vẽ 2 hình vuông-----------
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect squareRect = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    CGPathAddRect(path, NULL, squareRect);
    CGContextAddPath(context, path);
    
    CGAffineTransform tm = CGAffineTransformMakeTranslation(100, 100);//Dịch chuyển toạ độ
    CGPathAddRect(path, &tm, squareRect);
    CGContextAddPath(context, path);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextDrawPath(context, kCGPathStroke);

    
    //---------Vẽ 2 hình tròn------------
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGRect circleRect = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    CGPathAddEllipseInRect(path2, NULL, circleRect);
    CGContextAddPath(context, path2);
    
    
    CGPathAddEllipseInRect(path2, &tm, circleRect);
    CGContextAddPath(context, path2);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextDrawPath(context, kCGPathFillStroke);
 

}


@end
