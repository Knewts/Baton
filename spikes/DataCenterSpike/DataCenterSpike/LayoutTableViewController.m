//
//  LayoutTableViewController.m
//  Baton
//
//  Created by College of Fine Arts on 7/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "LayoutTableViewController.h"

@implementation LayoutTableViewController{
  
}
@synthesize layouts;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //TODO: Here, we're going to initialize the layout array, I think.  Either that or we should do it at application load.
    
    //for now, put something standard in there.
    layouts = [[NSMutableArray alloc]initWithObjects:[[Layout alloc] initWithTitle:@"Default"], nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"LayoutCell"];
	Layout *layout = [self.layouts objectAtIndex:indexPath.row];
	cell.textLabel.text = layout.title;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [self.layouts count];
}


@end
