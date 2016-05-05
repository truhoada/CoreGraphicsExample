//
//  QuartzView.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext(); //?
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextFillRect(context, rect);
}

- (void) cleanUpView {
    //Do nothing here !
}

- (void) customizeViewController: (UIViewController*) viewController {
    _viewController = viewController;
}

-(void)customizeView {
    
}


@end










