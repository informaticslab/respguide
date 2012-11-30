//
//  FaqsVC.m
//  respguide
//
//
//  Copyright 2011  U.S. Centers for Disease Control and Prevention
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software 
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "FaqsVC.h"
#import "AppManager.h"

@implementation FaqsVC

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super init])) {
        webView = [[UIWebView alloc] init];
        // Custom initialization
    }
    
    return self;
}

- (void)dealloc
{
    [webView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *mimeType = @"text/html";
	    
    // Do any additional setup after loading the view from its nib.
    NSString *theBundlePath = [[NSBundle mainBundle] bundlePath];
    
    DebugLog(@"Using bundle path %@", theBundlePath);  
    
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"faqs" ofType:@"xhtml"];
    DebugLog(@"Content file path = %@", thePath);  
    NSURL *baseURL = [NSURL fileURLWithPath:theBundlePath];
    if (thePath) {
        NSData *htmlData = [NSData dataWithContentsOfFile:thePath];
        [webView loadData:htmlData MIMEType:mimeType
         textEncodingName:@"UTF-8" baseURL:baseURL];
    }
    
    self.navigationItem.title = @"Respirator FAQs";
    

}


- (void)viewDidUnload
{
    [webView release];
    webView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
