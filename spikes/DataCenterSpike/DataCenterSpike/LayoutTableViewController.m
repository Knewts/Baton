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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"LayoutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [[layouts objectAtIndex:indexPath.row] title];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.layouts count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLayout"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BaseViewController *destViewController = segue.destinationViewController;
        destViewController.layout = [layouts objectAtIndex:indexPath.row];
    }
}

@end
