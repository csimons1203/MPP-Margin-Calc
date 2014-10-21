//
//  ViewController.h
//  MPP Margin Calc
//
//  Created by Charles Simons on 10/17/14.
//  Copyright (c) 2014 Charles Simons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *purchasePriceInsert;
@property (weak, nonatomic) IBOutlet UITextField *constructionBudgetInsert;
@property (weak, nonatomic) IBOutlet UITextField *revenueTargetInsert;
@property (weak, nonatomic) IBOutlet UITextField *profitInsert;
@property (weak, nonatomic) IBOutlet UILabel *profitMarginCalc;
@property (weak, nonatomic) IBOutlet UILabel *indirectsCalc;
//@property (weak, nonatomic) IBOutlet UILabel *overheadCalc;

@property (weak, nonatomic) IBOutlet UIButton *calculate;


@end



