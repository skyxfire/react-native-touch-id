//
//  NSData_MD5.m
//  TouchID
//
//  Created by Cyan on 2021/11/2.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "NSData_SHA256.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSData (NSData_SHA256)
- (NSString *)sha256 {
    // Create byte array of unsigned chars
    unsigned char sha256Buffer[CC_SHA256_DIGEST_LENGTH];
        
    // Create 16 byte MD5 hash value, store in buffer
    CC_SHA256(self.bytes, (unsigned int)self.length, sha256Buffer);
        
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", sha256Buffer[i]];
    
    return output;
}
@end
