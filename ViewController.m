//
//  ViewController.m
//  MPP Margin Calc
//
//  Created by Charles Simons on 10/17/14.
//  Copyright (c) 2014 Charles Simons. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateButtonPressed:(id)sender {
    
    //NSLog (@"PP %@, CB %@, SP %@, profit %@",self.purchasePriceInsert.text,self.constructionBudgetInsert.text,self.revenueTargetInsert.text,self.profitInsert.text);
    
    float purchasePriceInteger = [self.purchasePriceInsert.text intValue];
    float constructionBudgetInteger = [self.constructionBudgetInsert.text intValue];
    float revenueTargetInteger = [self.revenueTargetInsert.text intValue];
    float profitInsertInteger = [self.profitInsert.text intValue];
    
    double indirects = (revenueTargetInteger * .1);
    //double overhead = (revenueTargetInteger * .05); deprecated
    double profitMargin = (profitInsertInteger / revenueTargetInteger * 100);
    
    double profit = (revenueTargetInteger-(purchasePriceInteger+constructionBudgetInteger+indirects));
    //double construction =(revenueTargetInteger-(purchasePriceInteger+profitInsertInteger+indirects));
    //double purchasePrice = (revenueTargetInteger-(profitInsertInteger+constructionBudgetInteger+indirects));
    //double revenueTarget = ((constructionBudgetInteger+purchasePriceInteger+profitInsertInteger)*1.105);
    
    
    //NSString *profitMarginString = [NSString stringWithFormat:@"%.2f",profitMargin];//possibly useless//
    NSString *indirectsString = [NSString stringWithFormat:@"$%.2g",indirects];
    //NSString *overheadString = [NSString stringWithFormat:@"$%g",overhead];
    NSString *profitString = [NSString stringWithFormat:@"$%g",profit];
    //NSString *purchasePriceString = [NSString stringWithFormat:@"$%g",purchasePrice];
    //NSString *constructionString = [NSString stringWithFormat:@"$%g",construction];
    //NSString *revenueTargetString = [NSString stringWithFormat:@"$%g",revenueTarget];
    
    
    self.indirectsCalc.text = indirectsString;
   // self.overheadCalc.text = overheadString;
    
    //NSLog(@"Indirects = %g, Profit Margin = %@, profit = %g",indirects,profitMarginString, profit);
    
    //NSLog(@"profit = %g,construction= %g, purchasePrice = %g, revenueTarget = %g",profit,construction,purchasePrice,revenueTarget);
    
    //
   // if (self.profitInsert.text == nil){
   //     profitInsertInteger = profit;
   // }

   
    // This section of code is for figuring out the profit when its blank//
    if ([self.profitInsert.text length]>0) {
        NSString *profitMarginString = [NSString stringWithFormat:@"%.2f%%",profitMargin];
        self.profitMarginCalc.text = profitMarginString;
        NSLog(@"it was greater than 0");
    
    } else {
        double profitMargin = (profit / revenueTargetInteger * 100 );
        NSString *profitMarginString = [NSString stringWithFormat:@"%.2f%%",profitMargin];
        self.profitInsert.text = profitString;
        self.profitMarginCalc.text = profitMarginString;
        NSLog(@"Profit Margin = %@",profitMarginString);
        NSLog(@"Profit = %@",profitString);
    }
    //this section of code figures out the purchase price when its blank//
    if ([self.purchasePriceInsert.text length]>0) {
        NSLog(@"it was greater than 0");
        
    } else {
        double purchasePrice = (revenueTargetInteger-(profitInsertInteger+constructionBudgetInteger+indirects));
        NSString *purchasePriceString = [NSString stringWithFormat:@"$%g",purchasePrice];
        self.purchasePriceInsert.text = purchasePriceString;
        NSLog(@"PurchasePrice = %@",purchasePriceString);
    }
    // this section of code figures out the construction budget//
    if ([self.constructionBudgetInsert.text length]>0) {
        NSLog(@"it was greater than 0");
        
    } else {
        double construction =(revenueTargetInteger-(purchasePriceInteger+profitInsertInteger+indirects));
        NSString *constructionString = [NSString stringWithFormat:@"$%g",construction];
        self.constructionBudgetInsert.text = constructionString;
        NSLog(@"Construction Budget = %@",constructionString);
    }
    
    
    // this section of code figures out the revenue target//
    if ([self.revenueTargetInsert.text length]>0) {
        NSLog(@"it was greater than 0");
        
    } else {
        double revenueTarget = ((constructionBudgetInteger+purchasePriceInteger+profitInsertInteger)*1.105);
        double indirects = (revenueTarget * .1);
        double profitMargin = (profitInsertInteger / revenueTarget *100);
        
        NSString *profitMarginString = [NSString stringWithFormat:@"%.2f%%",profitMargin];
        NSString *indirectsString = [NSString stringWithFormat:@"$%.f",indirects];
        NSString *revenueTargetString = [NSString stringWithFormat:@"$%.f",revenueTarget];
        self.revenueTargetInsert.text = revenueTargetString;
        self.indirectsCalc.text = indirectsString;
        self.profitMarginCalc.text = profitMarginString;
        NSLog(@"Revenue Target = %@",revenueTargetString);
        NSLog(@"Indirects = %@",indirectsString);
        NSLog(@"profit Margin = %@",profitMarginString);
    }
}

@end
