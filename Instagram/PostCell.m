//
//  PostCell.m
//  Instagram
//
//  Created by Trustin Harris on 7/10/18.
//  Copyright © 2018 Trustin Harris. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import <ParseUI/ParseUI.h>
#import "DateTools.h"

@implementation PostCell

-(void)setCell:(Post*)posts{
    self.PostedPicIV.file = posts.image;
    [self.PostedPicIV loadInBackground];
    self.commentLabel.text = posts.caption;
    self.ProfilePicIV.layer.cornerRadius = 30;
    self.usernameLabel.text = posts.author.username;
    self.user2name2Label.text = posts.author.username;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    NSDate *_Nullable createdAT = posts.createdAt;
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    //NSString *dateTimeString = [formatter stringFromDate:createdAT];
    NSDate *timeNow = [NSDate date];
    NSInteger seconds = [timeNow secondsFrom:createdAT];
    NSDate *timeDate = [NSDate dateWithTimeIntervalSinceNow:-seconds];
    self.timeStamp.text = timeDate.timeAgoSinceNow;
    
    
}

- (IBAction)likeButton:(id)sender {
    if(self.liked == NO){
        self.likeButton.selected = YES;
    } else {
        self.likeButton.selected = NO;
        self.liked = YES;
    }
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
