//
//  NewsTableViewCell.m
//  test3
//
//  Created by canglong on 2025/5/11.
//

#import "NewsTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface NewsTableViewCell()
@property(nonatomic,strong,readwrite) UILabel *title;
@property(nonatomic,strong,readwrite) UILabel *source;
@property(nonatomic,strong,readwrite) UILabel *comment;
@property(nonatomic,strong,readwrite) UILabel *time;
@property(nonatomic,strong,readwrite) UIImageView *imageV;
@property(nonatomic,strong,readwrite) ListItemBean *itemBean;

@end

@implementation NewsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:( {
            UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(12, 12, 280, 90)];
//            label.backgroundColor = UIColor.redColor;
//            label.backgroundColor = UIColor.grayColor;
            label.font = [UIFont systemFontOfSize:18];
            label.textColor = UIColor.blackColor;
            self.title = label;
            label;
        } )];
        [self.contentView addSubview:( {
            UIImageView *imageV = [[UIImageView alloc ]initWithFrame:CGRectMake(300, 12, 90, 90)];
            
            imageV.backgroundColor = UIColor.grayColor;
            imageV.contentMode = UIViewContentModeScaleAspectFit;
//            imageV.layer.contentsGravity = kCAGravityTopLeft;
//            imageV.layer.contentsRect = CGRectMake(0, 0, 100, 100); // 自定义显示区域
            self.imageV = imageV;
            imageV;
        } )];
        [self.contentView addSubview:( {
            UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(12, 112, 50, 20)];
     
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = UIColor.grayColor;
            self.source = label;
            label;
        } )];
        [self.contentView addSubview:( {
            UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(90, 112, 50, 20)];
//            label.backgroundColor = UIColor.redColor;
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = UIColor.grayColor;
            self.comment = label;
            label;
        } )];
        [self.contentView addSubview:( {
            UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(160, 112, 50, 20)];
//            label.backgroundColor = UIColor.redColor;
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = UIColor.grayColor;
            self.time = label;
            label;
        } )];
        [self.contentView addSubview:( {
            UIButton *button = [[UIButton alloc ]initWithFrame:CGRectMake(300, 112, 50, 20)];
            button.backgroundColor = UIColor.redColor;
            [button setTitle:@"1111" forState:UIControlStateNormal];
            [button setTitle:@"2222" forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(delClick) forControlEvents:UIControlEventTouchUpInside];
            button;
        } )];
        
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick)]];
       
    }
    return  self;
}
/**
 {
                "uniquekey": "b16dabd40515d3dd4cb49557b72f1989",
                "title": "崇左移动：防诈骗防溺水，教育安全进万家",
                "date": "2025-05-15 17:57:00",
                "category": "头条",
                "author_name": "33号",
                "url": "https:\/\/mini.eastday.com\/mobile\/250515175707765533738.html",
                "thumbnail_pic_s": "",
                "is_content": "1"
            },
 */
-(void) setDataAndLayout:(ListItemBean *) itemBean{
    self.itemBean = itemBean;
    
    self.title.text = itemBean.title;
    self.source.text =itemBean.category;
    self.comment.text=itemBean.author_name;
    self.time.text =itemBean.date;
//    [self.imageV sd_setImageWithURL:[NSURL URLWithString:itemBean.thumbnail_pic_s]];
    
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:itemBean.thumbnail_pic_s]]];
//        self.imageV.image = image;
//
//    }];
//    [downloadImageThread start];
    
//    dispatch_queue_global_t downloadqueue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_main_t mainqueue = dispatch_get_main_queue();
//    dispatch_async(downloadqueue, ^{
//        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:itemBean.thumbnail_pic_s]]];
//        dispatch_async(mainqueue, ^{
//            self.imageV.image = image;
//        });
//    });
    __weak typeof(self) weakSelf = self;
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:itemBean.thumbnail_pic_s]]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            weakSelf.imageV.image = image;
        }];
    }];
    
    
//    self.title.frame = CGRectMake(12, 12, 260, 90);
    self.title.numberOfLines = 3;
//    [self.title sizeToFit];
    self.title.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    
    self.source.frame = CGRectMake(12, 112, 50, 20);
    [self.source sizeToFit];
    

    self.comment.frame= CGRectMake( self.source.frame.origin.x+self.source.frame.size.width+6, 112, 50, 20);
    [self.comment sizeToFit];
    
    self.time.frame= CGRectMake(self.comment.frame.origin.x+self.comment.frame.size.width+6, 112, 50, 20);
    [self.time sizeToFit];
    
    BOOL isRead = [ [NSUserDefaults standardUserDefaults] boolForKey:[self itemReadKey:self.itemBean] ];
    self.contentView.backgroundColor = isRead?UIColor.lightGrayColor:UIColor.whiteColor;
    
}
-(void) delClick{
    NSLog(@"delClick");
    if(self.delegate){
        [self.delegate newsTableViewCellDidClickDelete:self item:self.itemBean];
    }
}
-(void) itemClick{
    if(self.delegate){
        [self.delegate newsTableViewCellDidClickItem:self item:self.itemBean];
        
        [ [NSUserDefaults standardUserDefaults] setBool:YES forKey:[self itemReadKey:self.itemBean] ];
        self.contentView.backgroundColor = UIColor.lightGrayColor;
    }
}
-(NSString *) itemReadKey:(ListItemBean *)itemBean{
    return  [NSString stringWithFormat:@"key_item_%@",self.itemBean.uniquekey ] ;
}

@end
