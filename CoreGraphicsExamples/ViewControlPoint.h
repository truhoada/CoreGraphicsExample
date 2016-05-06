//
//  ViewControlPoint.h
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/6/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControlPoint : UIView
@property (nonatomic, assign) CGPoint origin;

- (instancetype)initAtPoint:(CGPoint)point;

@end
