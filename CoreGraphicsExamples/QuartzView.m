//
//  QuartzView.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    /* UIGraphicsGetCurrentContext()
     To draw to the screen in an iOS application, you set up a UIView object and implement its drawRect: method to perform drawing.
     The view’s drawRect: method is called when the view is visible on screen and its contents need updating.
     Before calling your custom drawRect: method, the view object automatically configures its drawing environment so that your code can start drawing immediately.
     As part of this configuration, the UIView object creates a graphics context (a CGContextRef opaque type) for the current drawing environment.
     You obtain this graphics context in your drawRect: method by calling the UIKit function UIGraphicsGetCurrentContext.
     */
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor); //Set Fill Color
    
    CGContextFillRect(context, rect); //Paints
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


/*
    A graphics context is an opaque data type (CGContextRef) that encapsulates the information Quartz uses to draw images to an output device, such as a PDF file, a bitmap, or a window on a display. The information inside a graphics context includes graphics drawing parameters and a device-specific representation of the paint on the page. All objects in Quartz are drawn to, or contained by, a graphics context.
 */




















