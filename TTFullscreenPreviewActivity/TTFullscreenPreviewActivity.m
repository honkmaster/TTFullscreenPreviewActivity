//
//  TTFullscreenPreviewActivity.m
//  Stud.IP
//
//  Created by Tobias Tiemerding on 1/20/13.
//  Copyright (c) 2013 TwoT App Development. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TTFullscreenPreviewActivity.h"

@interface TTFullscreenPreviewActivity()

@property (nonatomic, strong) NSArray *activityItems;

@end

@implementation TTFullscreenPreviewActivity


- (NSString *)activityType
{
	return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
	return NSLocalizedString(@"Fullscreen Preview", @"Fullscreen Preview");
}

- (UIImage *)activityImage
{
	return [UIImage imageNamed:@"TTFullscreenPreviewActivity"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]] && [QLPreviewController canPreviewItem:activityItem]) {
			return YES;
		}
	}
	
	return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
	// Filter out any items that aren't NSURL objects
    NSMutableArray *previewableActivityItems = [NSMutableArray arrayWithCapacity:[activityItems count]];
    for (id object in activityItems) {
        if ([object isKindOfClass:[NSURL class]] && [QLPreviewController canPreviewItem:object]) {
            [previewableActivityItems addObject:object];
        }
    }
    self.activityItems = previewableActivityItems;
}


- (UIViewController *)activityViewController
{
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    previewController.dataSource = self;
    previewController.delegate = self;
    previewController.currentPreviewItemIndex = 0;
    
    return previewController;
}

#pragma mark - QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)previewController
{
    return self.activityItems.count;
}

- (id)previewController:(QLPreviewController *)previewController previewItemAtIndex:(NSInteger)index
{
    return [self.activityItems objectAtIndex:index];
}

#pragma mark - QLPreviewControllerDelegate
- (void)previewControllerDidDismiss:(QLPreviewController *)controller
{
    [self activityDidFinish:YES];
}

@end
