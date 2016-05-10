//
//  ViewRingChart.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/9/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewRingChart.h"
#import "TextLayer.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@class RingLayer;


@implementation ViewRingChart {
    RingLayer *ringLayer;
    TextLayer *textLayer;
//    CGPoint center;
    NSTimer *timer;
}
@synthesize center;


- (void)customView {
    _fillColor = [UIColor colorWithRed:0.2f green:0.5f blue:0.8f alpha:1.0];
    _lineColor = [UIColor blackColor];
    _outerRadius = 60;
    _ringWidth = 15;
    
    _lineWidth = 1.0;
    center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _maxValue = 100.0f;
    
    [self setupLayers];
    
}

- (void)setupLayers {
    self.layer.needsDisplayOnBoundsChange = YES;
    ringLayer = [RingLayer layer];
    ringLayer.frame = self.bounds;
    
    ringLayer.fillColor = _fillColor;
    ringLayer.lineColor = _lineColor;
    ringLayer.outerRadius = _outerRadius;
    ringLayer.ringWidth = _ringWidth;
    ringLayer.lineWidth = _lineWidth;
    ringLayer.center = center;
    ringLayer.maxValue = _maxValue;
    
    ringLayer.value = _value;
    [self.layer addSublayer:ringLayer];
    [ringLayer setNeedsDisplay];
    
    UIFont *labelFont = [UIFont systemFontOfSize:38];
    textLayer = [[TextLayer alloc] initAt:center
                                   withFont:labelFont
                                    andText:[NSString stringWithFormat:@"%1.0f", _value]];
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:textLayer];
    [textLayer setNeedsDisplay];
}

- (void) customizeViewController: (UIViewController*) viewController {
    [super customizeViewController:viewController];
    
    UIBarButtonItem *clearButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(start)];
    viewController.navigationItem.rightBarButtonItem = clearButtonItem;
}

- (void) setValue:(float)value {
    _value = value;
    ringLayer.value = _value;
    textLayer.string = [NSString stringWithFormat:@"%1.0f", _value];
}

#pragma mark - May be removed when reuse this class
- (void) start
{
    self.value = 0.0f;
    timer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(animateRingChart) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    
}

- (void) animateRingChart {
    if (self.value < _maxValue) {
        self.value = self.value + 1.0f;
    }
}
- (void) cleanUpView {
    [timer invalidate];
}

@end

#pragma mark - RingLayer Implementation

@implementation RingLayer
@dynamic value;

- (void) drawInContext:(CGContextRef)ctx {
    float _innerRadius = _outerRadius - _ringWidth;
    // Get handle to current CGContext
    CGContextSetFillColorWithColor(ctx, _fillColor.CGColor);
    CGContextSetStrokeColorWithColor(ctx, _lineColor.CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(ctx, _lineWidth);
    
    //Path
    CGMutablePathRef path = CGPathCreateMutable();
    float radianValue = (self.value / self.maxValue ) * 2 * M_PI - M_PI_2;
    float startValue = - M_PI_2;
    
    
    CGPathAddArc(path, NULL, _center.x, _center.y, _outerRadius, radianValue, startValue, true);
    CGPathAddLineToPoint(path, NULL, _center.x, _center.y - _innerRadius);
    
    CGPathAddArc(path, NULL, _center.x, _center.y, _innerRadius, startValue, radianValue, false);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathEOFill);
    
    CGMutablePathRef outerPath = CGPathCreateMutable();
    CGPathAddArc(outerPath, NULL, _center.x, _center.y, _outerRadius + _lineWidth + 2, M_PI * 2, 0, true);
    CGContextAddPath(ctx, outerPath);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(path);
    CGPathRelease(outerPath);
}

+ (BOOL)needsDisplayForKey:(NSString*)key {
    if ([key isEqualToString:@"value"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

@end





















