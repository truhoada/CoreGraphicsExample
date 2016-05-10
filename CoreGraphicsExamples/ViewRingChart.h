//
//  ViewRingChart.h
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/9/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "QuartzView.h"

@interface ViewRingChart : QuartzView

@property (nonatomic, strong) UIColor * fillColor;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, assign) float outerRadius;
@property (nonatomic, assign) float ringWidth;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) CGPoint center;

@end

@interface RingLayer : CALayer
@property (nonatomic, strong) UIColor * fillColor;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, assign) float outerRadius;
@property (nonatomic, assign) float ringWidth;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) CGPoint center;

@end

