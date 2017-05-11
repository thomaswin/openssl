//
//  RSAWrapper.m
//  eNETS
//
//  Created by Innovation on 4/24/17.
//  Copyright © 2017 NETS. All rights reserved.
//

#import "RSAWrapper.h"

#include <openssl/opensslv.h>
#include <openssl/rsa.h>
#include <openssl/evp.h>
#include <openssl/bn.h>

@implementation RSAWrapper

-(NSString*)performRSAEncryptionForData:(NSString *)plaintext withModulus:(NSString*)mod andExponent:(NSString*)exp{

    
    // http://doginthehat.com.au/2014/04/basic-openssl-rsa-encryptdecrypt-example-in-cocoa/
    RSA * rsa_publickey = RSA_new();
    BIGNUM * modul = BN_new();
    BIGNUM * expon = BN_new();
    
    BN_hex2bn(&modul, [mod UTF8String]);
    BN_hex2bn(&expon, [exp UTF8String]);
    
    rsa_publickey->n = modul;
    rsa_publickey->e = expon;
    
    int rsa_length = RSA_size(rsa_publickey);
    NSLog(@"RSA Length : %d", rsa_length);
    
    NSData *data = [plaintext dataUsingEncoding:NSUTF8StringEncoding];
    
    // Allocate a buffer
    int maxSize = RSA_size(rsa_publickey);
    unsigned char *output = (unsigned char *) malloc(maxSize * sizeof(char));
    
    int bytes = RSA_public_encrypt((int)[data length], [data bytes], output, rsa_publickey, RSA_PKCS1_PADDING);

    NSData *result = [NSData dataWithBytes:output length:bytes];
    
    const unsigned char *dataBuffer = (const unsigned char *)[result bytes];
    
    if (!dataBuffer)
        return [NSString string];
    
    NSUInteger          dataLength  = [result length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    
    NSString * encrypted = [NSString stringWithFormat:@"RSA%@", hexString];
    return encrypted;
     
    
}

@end





















