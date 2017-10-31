//
//  TwoViewController.m
//  IdentityScan
//
//  Created by MCEJ on 2017/10/31.
//  Copyright © 2017年 MCEJ. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.iDInfo.name;
    
    self.nameLabel.text = self.iDInfo.name;
    self.identityLabel.text = self.iDInfo.cerNo;
    self.addressLabel.text = self.iDInfo.address;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
