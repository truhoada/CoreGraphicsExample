//
//  DetailMainScreenVC.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "DetailMainScreenVC.h"
#import "QuartzView.h"

@interface DetailMainScreenVC ()

@end

@implementation DetailMainScreenVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void) viewWillDisappear:(BOOL)animated {
    if ([self.view respondsToSelector:@selector(cleanUpView)]){
        [self.view performSelector:@selector(cleanUpView)];
    }
}


@end
