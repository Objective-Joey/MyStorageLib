//
//  ContentModel.m
//  ReactiveCocoa_Use
//
//  Created by koala on 2018/6/13.
//  Copyright © 2018年 koala. All rights reserved.
//

#import "ContentModel.h"

@implementation ContentModel

- (NSArray *)headNameArray {
    
    if (_headNameArray == nil) {
        _headNameArray = @[@"运行时底层",@"消息转发",@"关联对象",@"动态添加",@"方法交换",@"KVO原理",@"应用场景",@"其他",@"内存管理"];
    }
    return _headNameArray;
}

- (NSArray *)demoArray{
    
    if (_demoArray == nil) {
        _demoArray = @[
        @[@"objc_runtime",@"objc_message",@"objc_NSObject"],
        @[@"message_forwardDemo"],
        @[@"Associated_Demo"],
        @[@"runTimeAdd_Demo"],
        @[@"methodExchange_Demo"],
        @[@"KVO_real"],
        @[@"runTimeUse_Demo"],
        @[@"Others"],
        @[@"MemoryMangage_general",@"Dealloc_demo"]
        ];
    }
    return _demoArray;
}


- (NSDictionary *)describeDict {
    
    if (_describeDict == nil) {
        
        _describeDict = @{
                          //信号的基本使用
            
            
                          @"objc_message":@"消息发送和转发",
                          @"objc_runtime":@"运行时核心定义",
                          @"objc_NSObject":@"NSObject头文件,包括NSObject协议，方法和属性暴露",
                          @"message_forwardDemo":@"消息转发的整个流程",
                          @"Associated_Demo":@"当需要给一个对象添加变量，但是不想用继承而改变代码",
                          @"KVO_real":@"通过runtime运行时机制实现的。第一次观察某个对象时，runtime会创建一个被监听类的子类。在这个新的子类中，它会重写所有被观察的key，然后将对象的isa指针指向新创建的类。对象变成了新的子类的实例。这些被重写的方法中添加了调用通知观察者的方法的代码。当一个对象的一个属性改变时，会触发setKey方法，但这个方法被重写了，并且在内部添加了发送通知机制",
                          @"runTimeAdd_Demo":@"例如 TABAnimated 动态生成类 替换原始方法IMP 为自定义方法的IMP，实现无侵入hook掉原方法。类似思想 替换代理方法为Block"
                          };
    }
    return _describeDict;
    
}


@end
