//
//  RespiratorDetailsVC.m
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


#import "RespiratorDetailsVC.h"
#import "AppManager.h"
#import "Respirator.h"

@implementation RespiratorDetailsVC

@synthesize tv;

AppManager *appMgr;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    appMgr = [AppManager singletonAppManager];


}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) 
        return 4;
    else
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"RespClassCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    // Model details section
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"model";
                cell.detailTextLabel.text = appMgr.dc.selectedRespirator.modelNumber;
                break;
                
            case 1:
                cell.textLabel.text = @"supplier";
                cell.detailTextLabel.text = appMgr.dc.selectedRespirator.manufacturer;
                break;
                
            case 2:
                cell.textLabel.text = @"approval number";
                cell.detailTextLabel.text = appMgr.dc.selectedRespirator.approvalNumber;
                break;
                
            case 3:
                cell.textLabel.text = @"valve";
                if (appMgr.dc.selectedRespirator.hasValve) {
                    cell.detailTextLabel.text = @"Yes";
                } else {
                    cell.detailTextLabel.text = @"No";

                }
                break;
                
            default:
                break;
        }
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"contact number";
                cell.detailTextLabel.text = appMgr.dc.selectedRespirator.contactNumber;
                break;
                
            case 1:
                cell.textLabel.text = @"user info";
                //if (appMgr.dc.selectedRespirator.documentationUrl != nil)
                //    cell.detailTextLabel.text = @"Link to User Documentation";
                cell.detailTextLabel.text = appMgr.dc.selectedRespirator.documentationUrl;
                break;
                
            default:
                break;
        }
    }
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 2;
    [cell.textLabel sizeToFit];
	
	cell.detailTextLabel.lineBreakMode = UILineBreakModeTailTruncation;
    cell.detailTextLabel.numberOfLines = 1;
    //[cell.detailTextLabel sizeToFit];
    return cell;
    
}


#pragma mark -
#pragma mark Section header titles

/*
 HIG note: In this case, since the content of each section is obvious, there's probably no need to provide a title, but the code is useful for illustration.
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case 0:
            title = @"Model Details";
            break;
        case 1:
            title = @"Additional Information";
            break;
        default:
            break;
    }
    return title;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *trimmedPhoneNumber = nil;
    NSString *docUrl = nil;
    
    // Model details section
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
               trimmedPhoneNumber = [appMgr.dc.selectedRespirator.contactNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", trimmedPhoneNumber]]];

                break;
                
                
            case 1:
                docUrl = appMgr.dc.selectedRespirator.documentationUrl;;
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:docUrl]];
                break;
                
            default:
                break;
        }
    }
 
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
