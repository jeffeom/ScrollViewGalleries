//
//  MyViewController.m
//  ScrollViewGalleries
//
//  Created by Jeff Eom on 2016-07-11.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self zoomingScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zoomingScrollView{
    
    self.myScrollView.delegate = self;
    self.myScrollView.minimumZoomScale = 1.0;
    self.myScrollView.maximumZoomScale = 4.0;
    self.myScrollView.zoomScale = 1.0;
    
    
    [self.myScrollView addSubview:self.myImageView];
    [self.view addSubview:self.myScrollView];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.myImageView;
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
