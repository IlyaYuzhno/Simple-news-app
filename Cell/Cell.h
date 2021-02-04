//
//  TableViewCell.h
//  l2_IlyaD
//
//  Created by Ilya Doroshkevitch on 23.12.2020.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import <YYWebImage/YYWebImage.h>


NS_ASSUME_NONNULL_BEGIN

@interface Cell : UITableViewCell

@property (nonatomic, strong) NewsModel *news;



@end

NS_ASSUME_NONNULL_END
