//
//  Router.m
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import "Router.h"

@implementation Router


+ (void)goNext: (NSArray *)news indexPath:(NSIndexPath *)indexPath controller:(UIViewController *)controller {

    SecondaryNewsViewController *secondaryNewsViewController = [[SecondaryNewsViewController alloc] init];

    secondaryNewsViewController.news = [news objectAtIndex:indexPath.row];

    // Используя контроллер навигации
   [controller.navigationController showViewController:secondaryNewsViewController sender:self];

}


@end
