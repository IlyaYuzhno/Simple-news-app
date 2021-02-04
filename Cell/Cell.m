//
//  TableViewCell.m
//  l2_IlyaD
//
//  Created by Ilya Doroshkevitch on 23.12.2020.
//

#import "Cell.h"


@interface Cell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *image;

@end



@implementation Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.contentView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
        self.contentView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.contentView.layer.shadowRadius = 10.0;
        self.contentView.layer.shadowOpacity = 1.0;
        self.contentView.layer.cornerRadius = 30.0;
        self.contentView.backgroundColor = [UIColor whiteColor];
      
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 30, 260, 80.0)];
        _titleLabel.adjustsFontSizeToFitWidth = true;
        _titleLabel.backgroundColor = [UIColor lightTextColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 5, 200, 20.0)];
        _dateLabel.adjustsFontSizeToFitWidth = true;
        _dateLabel.textColor = [UIColor lightGrayColor];
        _dateLabel.font = [UIFont italicSystemFontOfSize:14];
        _dateLabel.numberOfLines = 0;
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_dateLabel];
        
        _image = [[UIImageView alloc] initWithFrame: CGRectMake(5.0, 5.0, 110.0, 110.0)];
        _image.contentMode = UIViewContentModeScaleToFill;
        _image.layer.cornerRadius = 20;
        _image.layer.masksToBounds = YES;
      
        [self.contentView addSubview:_image];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    self.contentView.frame = CGRectMake(10.0, 10.0, [UIScreen mainScreen].bounds.size.width - 20.0, self.frame.size.height - 20.0);
    
    
}


- (void)setNews:(NewsModel *)news {
    _news = news;
    _titleLabel.text = [NSString stringWithFormat:@"%@", news.title];
    _dateLabel.text = [NSString stringWithFormat:@"%@", news.publishedAt];
    NSURL *imgUrl = [NSURL URLWithString: news.urlToImage];
    [_image yy_setImageWithURL:imgUrl options:YYWebImageOptionSetImageWithFadeAnimation];
    
}

@end
