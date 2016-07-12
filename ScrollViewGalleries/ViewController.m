//
//  ViewController.m
//  ScrollViewGalleries
//
//  Created by Jeff Eom on 2016-07-11.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property UIImageView *imageToSend;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageToSend = [[UIImageView alloc] init];
    
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-in-Field"]];
    UIImageView *image2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-night"]];
    UIImageView *image3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-zoomed"]];
    
    image1.userInteractionEnabled = YES;
    image2.userInteractionEnabled = YES;
    image3.userInteractionEnabled = YES;
    
    image1.translatesAutoresizingMaskIntoConstraints = NO;
    image2.translatesAutoresizingMaskIntoConstraints = NO;
    image3.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.myScrollView addSubview:image1];
    [self.myScrollView addSubview:image2];
    [self.myScrollView addSubview:image3];
    
    self.myScrollView.pagingEnabled = YES;
    
    //image1
    NSLayoutConstraint *image1Left = [NSLayoutConstraint constraintWithItem:image1
                                                                       attribute:NSLayoutAttributeLeft
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.myScrollView
                                                                       attribute:NSLayoutAttributeLeft
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *image1Top = [NSLayoutConstraint constraintWithItem:image1
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *image1Bottom = [NSLayoutConstraint constraintWithItem:image1
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0];
    
    [self.view addConstraints: @[image1Left, image1Top, image1Bottom]];
    
    //image2
    NSLayoutConstraint *image2Left = [NSLayoutConstraint constraintWithItem:image2
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:image1
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:0];
    NSLayoutConstraint *image2Top = [NSLayoutConstraint constraintWithItem:image2
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0];
    NSLayoutConstraint *image2Bottom = [NSLayoutConstraint constraintWithItem:image2
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0];
    
    [self.view addConstraints: @[image2Left, image2Top, image2Bottom]];
    
    //image3
    NSLayoutConstraint *image3Left = [NSLayoutConstraint constraintWithItem:image3
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:image2
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:0];
    
    NSLayoutConstraint *image3Right = [NSLayoutConstraint constraintWithItem:image3
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.myScrollView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0 constant:0];
    
    NSLayoutConstraint *image3Top = [NSLayoutConstraint constraintWithItem:image3
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0];
    
    NSLayoutConstraint *image3Bottom = [NSLayoutConstraint constraintWithItem:image3
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0];
    
    [self.view addConstraints: @[image3Left, image3Right, image3Top, image3Bottom]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.myScrollView setContentSize: self.view.frame.size];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)imageTapped:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    
    UIView *view = tap.view;
    CGPoint location = [tap locationInView:view];
    
    self.imageToSend = (UIImageView *)[view hitTest:location withEvent:nil];

    [self performSegueWithIdentifier:@"showDetail" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]){
        MyViewController *myVC = segue.destinationViewController;
        myVC.imageReceived = self.imageToSend;
    }
}

@end
