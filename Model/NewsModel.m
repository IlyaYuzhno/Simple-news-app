//
//  NewsModel.m
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import "NewsModel.h"

@implementation NewsModel


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"title"];
        _author = [dictionary valueForKey:@"author"];
        _content = [dictionary valueForKey:@"description"];
        _urlToImage = [dictionary valueForKey:@"urlToImage"];
        _publishedAt = dateFromString([dictionary valueForKey:@"publishedAt"]);
        
    }
    return self;
}


NSDate *dateFromString(NSString *dateString) {
    if (!dateString) { return  nil; }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *correctSrtingDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctSrtingDate = [correctSrtingDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString: correctSrtingDate];
    
    
}



@end
