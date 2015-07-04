#import "MasterViewController.h"

@interface MasterViewController() <UITableViewDataSource>
@property NSArray *trojansArray;

@end

@implementation MasterViewController


-(void) viewDidLoad{

    [self loadData];
}

-(IBAction)onTextEntered:(UITextField *)sender{

    NSManagedObject *trojan = [NSEntityDescription insertNewObjectForEntityForName:@"Trojan" inManagedObjectContext:self.managedObjectContext];
    [trojan setValue:sender.text forKey:@"name"];
    [trojan setValue:@(arc4random_uniform(10)+1) forKey:@"prowess"];
    [self.managedObjectContext save:nil];
    [self loadData];
    sender.text = @"";
    [self resignFirstResponder];


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.trojansArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSManagedObject *trojan = [self.trojansArray objectAtIndex:indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [trojan valueForKey:@"name"];
    cell.detailTextLabel.text = [[trojan valueForKey:@"prowess"] stringValue];


    return cell;
}

-(void) loadData{

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Trojan"];
    NSSortDescriptor *sort1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sort2 = [[NSSortDescriptor alloc] initWithKey:@"prowess" ascending:NO];

    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"prowess > 7"];
    request.predicate = predicate1;

    request.sortDescriptors =[NSArray arrayWithObjects:sort1, sort2, nil];
    self.trojansArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

@end