//
//  Router.h
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import <Foundation/Foundation.h>
#import "SecondaryNewsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Router : NSObject

+ (void)goNext: (NSArray *)news indexPath:(NSIndexPath *)indexPath controller:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
