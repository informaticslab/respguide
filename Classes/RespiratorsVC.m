//
//  RespiratorVC.m
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


#import "RespiratorsVC.h"
#import "RespiratorDetailsVC.h"
#import "RespiratorClass.h"
#import "Respirator.h"
#import "AppManager.h"

@implementation RespiratorsVC

AppManager *appMgr;

NSArray *respirators;
RespiratorClass *currentRespClass;


#pragma mark -
#pragma mark Initialization

/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 self = [super initWithStyle:style];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    appMgr = [AppManager singletonAppManager];
    
	respirators  = [appMgr.dc getRespirators];
    currentRespClass = appMgr.dc.selectedClass;
    self.navigationItem.title = appMgr.dc.selectedClass.name;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if ([currentRespClass.name isEqualToString:@"N95 Facepiece Respirators"]) 
        return 5;
    else 
        return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return [respirators count];
    // with demo of index only one row per table
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    // hard coded for demo purposes
    if ([currentRespClass.name isEqualToString:@"N95 Facepiece Respirators"]) {
        switch (section ) {
            case 0:
                return @"3";
            case 1:
                return @"A";
            case 2:
                return @"C";
            case 3:
                return @"F";
            case 4:
                return @"I";
                
        }
    }  else    if ([currentRespClass.name isEqualToString:@"N99 Facepiece Respirators"]) {
        switch (section ) {
            case 0:
                return @"F";
        }
        
    }  
    return nil; 
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"RespiratorsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    DebugLog(@"Section = %d", indexPath.section)
    //if ([respirators count]
	Respirator *cellRespirator = [respirators objectAtIndex:indexPath.section];
	cell.textLabel.text = [NSString stringWithFormat:@"%@, Model %@", cellRespirator.manufacturer, cellRespirator.modelNumber]; 
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    [cell.textLabel sizeToFit];
    
    return cell;
}



#pragma mark -
#pragma mark Table view delegate



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Navigation logic may go here. Create and push another view controller.
    RespiratorDetailsVC *detailViewController = [[RespiratorDetailsVC alloc] initWithNibName:@"RespiratorDetailsVC" bundle:nil];
    [appMgr.dc setSelectedRespiratorWithIndex:indexPath.section];
    
	// Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return[NSArray arrayWithObjects:@"#", @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h",
           @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", 
           @"v", @"w", @"x", @"y", @"z", nil];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title 
               atIndex:(NSInteger)index 
{
    return 1;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

