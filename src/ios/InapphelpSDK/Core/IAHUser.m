//Copyright (c) 2014 HelpStack (http://helpstack.io)
//
//Permission is hereby granted, free of charge, to any person obtaining a cop
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

#import "IAHUser.h"

@implementation IAHUser

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.apiHref forKey:@"apiHref"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.userSecret forKey:@"userSecret"];
    [aCoder encodeObject:self.pushToken forKey:@"pushToken"];

}
- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {

        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.apiHref = [aDecoder decodeObjectForKey:@"apiHref"];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.userSecret = [aDecoder decodeObjectForKey:@"userSecret"];
        self.pushToken = [aDecoder decodeObjectForKey:@"pushToken"];
    }

    return self;
}

- (NSString *)name {
    if (self.firstName == nil && self.lastName == nil) return nil;
    if (self.lastName == nil) return self.firstName;
    if (self.firstName == nil) return self.lastName;
    return [NSString stringWithFormat:@"%@ %@",self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nUser Name: %@ \nEmail: %@\nApiHref = %@", self.name, _email, _apiHref];
}

-(BOOL)isValideUser {
    return self.firstName == nil || self.lastName == nil || self.email == nil;
};

@end
