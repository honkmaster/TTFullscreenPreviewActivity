# TTFullscreenPreviewActivity

`TTFullscreenPreviewActivity` is a `UIActivity` subclass that creates a fullscreen preview for a file using a QLPreviewcontroller.

![TTFullscreenPreviewActivity screenshot](http://s14.directupload.net/images/130121/hezpsqie.png "TTFullscreenPreviewActivity screenshot")

## Requirements

- As `UIActivity` is iOS 6 only, so is the subclass.
- QuickLook Framework
- This project uses ARC. If you want to use it in a non ARC project, you must add the `-fobjc-arc` compiler flag to TTFullscreenPreviewActivity.m in Target Settings > Build Phases > Compile Sources.

## Installation

Add the `TTFullscreenPreviewActivity` subfolder to your project. There are no required libraries other than `UIKit` and `QuickLook`.

## Usage.

```objectivec
NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"pdf"]];
TTFullscreenPreviewActivity *fullscreenPreviewActivity = [[TTFullscreenPreviewActivity alloc] init];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:@[fullscreenPreviewActivity]];
    
// Show UIActivityViewController 
[self presentViewController:activityViewController animated:YES completion:NULL];
```
## License

Copyright (c) 2012-2013 Tobias Tiemerding

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


