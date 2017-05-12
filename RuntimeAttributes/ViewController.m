//
//  ViewController.m
//  RuntimeAttributes
//
//  Created by lijunhong on 2017/5/10.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readAllIvarList];
}


- (void)readAllIvarList {
    
    Person *xiaoming = [[Person alloc] init];
    xiaoming.name = @"小明";
    xiaoming.score = 99.0;
    xiaoming.height = 175.4;
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([xiaoming class], &count);
    for (int i = 0; i<count; ++i) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"name:%s type:%s",name,type);
//        ivar = class_getInstanceVariable([xiaoming class], name);
//        id value = object_getIvar(xiaoming, ivar);
//        NSLog(@"value:%@",value);
        
    }
    free(ivars);
    
    
    
    objc_property_t * properties = class_copyPropertyList([Person class], &count);
    for (int i = 0; i<count; ++i) {
        objc_property_t property = properties[i];
        NSLog(@"name:%s",property_getName(property));
        id value = [xiaoming valueForKey:[NSString stringWithUTF8String:property_getName(property)]];
        NSLog(@"%@",value);
        
        unsigned int tCount = 0;
        objc_property_attribute_t *list = property_copyAttributeList(property, &tCount);
        for (int j = 0; j<tCount; ++j) {
            objc_property_attribute_t p = list[j];
            
            NSLog(@"tname:%s tvalue:%s",p.name,p.value);
        }
    }
    free(properties);

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
