//
//  TwoViewController.h
//  IdentityScan
//
//  Created by MCEJ on 2017/10/31.
//  Copyright © 2017年 MCEJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDInfo.h"

@interface TwoViewController : UIViewController

@property (nonatomic,retain)IDInfo *iDInfo;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
