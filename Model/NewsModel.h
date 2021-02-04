//
//  NewsModel.h
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *urlToImage;
@property (nonatomic, strong) NSDate *publishedAt;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end


