//
//  Interactor.h
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//http://newsapi.org/v2/top-headlines?country=ru&apiKey=92cabf74797a4bce9f5fc71de9271e1f

#import <Foundation/Foundation.h>
#import "NewsModel.h"


#define API_KEY @"92cabf74797a4bce9f5fc71de9271e1f"
#define API_URL @"https://newsapi.org/v2/top-headlines?country=ru"


@interface Interactor : NSObject

- (void)newsRequest: (void (^)(NSArray *news))completion;
- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion;



@end
