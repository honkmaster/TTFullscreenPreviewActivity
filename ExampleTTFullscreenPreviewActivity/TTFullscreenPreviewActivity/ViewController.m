//
//  ViewController.m
//  TTFullscreenPreviewActivity
//
//  Created by Tobias Tiemerding on 1/21/13.
//  Copyright (c) 2013 Tobias Tiemerding. All rights reserved.
//

#import "ViewController.h"
#import "TTFullscreenPreviewActivity.h"

@interface ViewController ()

@property (nonatomic, strong) UIPopoverController *activityPopoverController;

- (IBAction)openPreview:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openPreview:(id)sender
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"empty" ofType:@"pdf"];
    NSURL *URL = [NSURL fileURLWithPath:filePath];
    
    TTFullscreenPreviewActivity *fullscreenActivity = [[TTFullscreenPreviewActivity alloc] init];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:@[fullscreenActivity]];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        // Show UIActivityViewController
        [self presentViewController:activityViewController animated:YES completion:NULL];
    } else {
        // Create pop up
        self.activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        // Show UIActivityViewController in popup
        [self.activityPopoverController presentPopoverFromRect:((UIButton *)sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
