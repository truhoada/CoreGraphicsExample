//
//  ViewDrawLine.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewDrawLine.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewDrawLine

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect]; //Vẽ phông nền trắng
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context); //Chuẩn bị vẽ 1 đường
    CGSize size = self.bounds.size;
    
    CGContextMoveToPoint(context, 0, 0); //Bắt đầu 1 subPath mới tại điểm xác định
    CGContextAddLineToPoint(context, size.width, size.height);//Kéo một đường thẳng từ điểm hiện tại đến một điểm xác định
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor); //Set stroke color: Màu nét vẽ hiện tại
    CGContextSetLineWidth(context, 2.0);//Set width Line
    CGContextDrawPath(context, kCGPathStroke); //Vẽ Path hiện tại với các thuộc tính đã set.

    
    CGContextMoveToPoint(context, size.width, 0);
    CGContextAddLineToPoint(context, 0, size.height);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 5);//Set width Line
    CGContextDrawPath(context, kCGPathStroke);
    
    
}


@end
