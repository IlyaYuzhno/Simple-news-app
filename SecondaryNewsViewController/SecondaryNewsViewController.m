//
//  SecondaryNewsViewController.m
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import "SecondaryNewsViewController.h"

@interface SecondaryNewsViewController ()

@property (nonatomic, strong) UITextView *contentTextView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIView *newsView;

@end

@implementation SecondaryNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@", _news.title];
    self.view.backgroundColor = [UIColor blackColor];
    
    // add gradient layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor orangeColor].CGColor, (id)[UIColor purpleColor].CGColor];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    //UIEdgeInsets safeAreaInsets = self.view.safeAreaInsets;
    CGRect safeAreaFrame = CGRectMake(self.view.frame.origin.x + 7,
                                      self.view.frame.origin.y + 100,
                                      400,
                                      600);
    
    _newsView = [[UIView alloc] initWithFrame: safeAreaFrame];
    _newsView.backgroundColor = [UIColor whiteColor];
    _newsView.layer.cornerRadius = 6;
    _newsView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
    _newsView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _newsView.layer.shadowRadius = 10.0;
    _newsView.layer.shadowOpacity = 1.0;
    [self.view addSubview:_newsView];
    
    
    _contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 310, 390, 280.0)];
    _contentTextView.font = [UIFont systemFontOfSize:24];
    _contentTextView.contentMode = UIViewContentModeScaleToFill;
    if (_contentTextView.contentSize.height > _contentTextView.frame.size.height) {
        int fontIncrement = 1;
        while (_contentTextView.contentSize.height > _contentTextView.frame.size.height) {
            _contentTextView.font = [UIFont systemFontOfSize:24 - fontIncrement];
            fontIncrement++;
        }
    }
    _contentTextView.textAlignment = NSTextAlignmentLeft;
    [_newsView addSubview:_contentTextView];
    
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 285, 200, 20.0)];
    _dateLabel.adjustsFontSizeToFitWidth = true;
    _dateLabel.textColor = [UIColor lightGrayColor];
    _dateLabel.font = [UIFont italicSystemFontOfSize:14];
    _dateLabel.numberOfLines = 0;
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    [_newsView addSubview:_dateLabel];
    
    
    _image = [[UIImageView alloc] initWithFrame: CGRectMake(5.0, 5.0, 390.0, 280.0)];
    _image.layer.cornerRadius = 6;
    _image.layer.masksToBounds = YES;
    _image.backgroundColor = [UIColor redColor];
    [_newsView addSubview:_image];

    _contentTextView.text = [NSString stringWithFormat:@"%@", _news.content];
    _dateLabel.text = [NSString stringWithFormat:@"%@", _news.publishedAt];
    NSURL *imgUrl = [NSURL URLWithString: _news.urlToImage];
    [_image yy_setImageWithURL:imgUrl options:YYWebImageOptionSetImageWithFadeAnimation];
}

@end
