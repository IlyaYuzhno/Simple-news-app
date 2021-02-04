//
//  Interactor.m
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import "Interactor.h"

@implementation Interactor


- (void)newsRequest: (void (^)(NSArray *news))completion {
    NSString *urlString = [NSString stringWithFormat:@"%@&apiKey=%@", API_URL, API_KEY];

    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        if (response) {
            NSMutableArray *json = [response valueForKey:@"articles"];
            NSMutableArray *array = [NSMutableArray new];
            
            for (int i = 0; i <= json.count - 1; i++) {
                NSDictionary *value = json[i];
                NewsModel *news = [[NewsModel alloc] initWithDictionary:value];
                [array addObject:news];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(array);
            });
        }
    }];
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    }] resume] ;
}

@end
