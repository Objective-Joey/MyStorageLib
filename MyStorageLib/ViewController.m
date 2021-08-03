//
//  ViewController.m
//  MyStorageLib
//
//  Created by Joey on 2021/8/2.
//

#import "ViewController.h"
#import "ContentModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Student.h"
#import "DeallocViewController.h"
#import "AppleMemoryManageViewController.h"
#import "KVORealViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView    *tbView;
@property (nonatomic, strong) ContentModel *contentModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tbView];
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = [self.contentModel.headNameArray objectAtIndex:section];
    return label;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.contentModel.demoArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.contentModel.demoArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *type = self.contentModel.demoArray[indexPath.section][indexPath.row];
    cell.textLabel.text = type;
    cell.detailTextLabel.text = [self.contentModel.describeDict objectForKey:type];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *type = self.contentModel.demoArray[indexPath.section][indexPath.row];
    if ([self respondsToSelector:NSSelectorFromString(type)]) {
        ( (void (*) (id, SEL)) objc_msgSend ) (self, NSSelectorFromString(type));
    }

}
- (UITableView *)tbView{
    
    if (_tbView == nil) {
        //        CGRect tbRect = CGRectMake(0, 0, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - HEADER_HEIGHT);
        _tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];;
        _tbView.delegate =  self;
        _tbView.dataSource = self;
        _tbView.tableFooterView = [[UIView alloc] init];
    }
    return _tbView;
}
- (ContentModel *)contentModel {
    
    if (_contentModel == nil) {
        _contentModel = [[ContentModel alloc] init];
    }
    return _contentModel;
    
}

-(void)message_forwardDemo{
    Student * s = [Student new];

    
}

-(void)Associated_Demo{
    
}

-(void)MemoryMangage_general{
    AppleMemoryManageViewController * m = [AppleMemoryManageViewController new];
    m.url = @"https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html#//apple_ref/doc/uid/10000011i";
    [self.navigationController pushViewController:m animated:NO];
}
-(void)Dealloc_demo{
    DeallocViewController * m = [DeallocViewController new];
    m.url = @"https://www.jianshu.com/p/5aee2e571f6b";
    [self.navigationController pushViewController:m animated:NO];
}

-(void)KVO_real{
    KVORealViewController * m = [KVORealViewController new];
    m.url = @"https://cloud.tencent.com/developer/article/1438617";
    [self.navigationController pushViewController:m animated:NO];
}
@end
