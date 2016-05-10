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
    //kCGPAthStroke: You can fill the inside of a selection, path, or layer with a color or pattern. You can also add color to the outline of a selection or path, called stroking.
    /*
     kCGPathFill: Đổ màu bên trong Path
     kCGPathEOFill: Đổ màu bên trong Path theo Quy tắc chẵn lẻ
     kCGPathStroke: Set màu cho đường kẻ bên ngoài Path
     kCGPathFillStroke: Vừa đổ bên  trong, vừa set màu cho đường kẻ ngoài
     kCGPathEOFillStroke: Đổ trong, vẽ ngoài theo Quy tắc chẵn lẻ
     */
    
    CGContextMoveToPoint(context, size.width, 0); //Lại bắt đầu 1 điểm mới để vẽ subPath
    CGContextAddLineToPoint(context, 0, size.height); // Thêm đường thẳng từ điểm đến điểm
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 5);//Set width Line
    CGContextDrawPath(context, kCGPathStroke);
    
    
}


@end
