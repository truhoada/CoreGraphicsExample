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
    
    
    SEL sel = @selector(customView);
    
    if ([self.view respondsToSelector:sel]) {
        //Tắt compiler warning performSelector may cause a leak because its selector is unknown
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.view performSelector:sel];
        #pragma clang diagnostic pop
    }
    
}

- (void) viewWillDisappear:(BOOL)animated {
    if ([self.view respondsToSelector:@selector(cleanUpView)]){
        [self.view performSelector:@selector(cleanUpView)];
    }
}


@end
