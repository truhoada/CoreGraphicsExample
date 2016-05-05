//
//  QuartzView.h
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzView : UIView
@property (nonatomic, weak) UIViewController *viewController;


// Inherited class may implemen cutomizeView method
- (void) customizeView;

//Do some clean up work
- (void) cleanUpView;

//Configure the ViewController that holds this view
- (void) customizeViewController: (UIViewController*) viewController;





@end
