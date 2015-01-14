//
//  ParseWordFile.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/20/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "ParseWordFile.h"
#import "Word.h"

@implementation ParseWordFile

+ (void)parseWordFile:(NSMutableArray*)input withFileName:(NSString*)fileName
{
    
    @autoreleasepool {
        
        //get the documents directory:
        
        //make a file names to write the data to using the documents directory:
        NSString        *fileContents;
        NSString        *inFileContents;
        NSString        *lineContents;
        NSFileManager   *filemgr = [NSFileManager defaultManager];
        NSFileHandle    *inFile;
        int             i;
        
        //INSERT FILE PATH IN THIS LINE!
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"]];
        
        NSLog(@" Length of File: %i", [data length]);
        inFileContents = [[NSString alloc]initWithData: data encoding:NSUTF8StringEncoding];
       // NSLog(@"%@", inFileContents);
        BOOL keyFound = NO;
        int space = 2;
        int keystart = 0;
        int wordstart = 3;
        NSRange key;
        NSRange word;
        for(i = 1; i < [inFileContents length]; i++){
            if(' ' == [inFileContents characterAtIndex:i] && !keyFound){
                space = i;
                wordstart = i+1;
                keyFound = YES;
            }
            else if('\n' == [inFileContents characterAtIndex:i]){
                word.length = i - wordstart;
                word.location = wordstart;
                key.length = space - keystart;
                key.location = keystart;
                if(word.length > [inFileContents length]){
                    NSLog(@"Word length error");
                } else if(key.length > [inFileContents length]){
                    NSLog(@"Key length error");
                }
                else {
                    NSString *temp = [[NSString alloc] initWithString:[inFileContents substringWithRange:word]];
                    if(' ' ==[temp characterAtIndex:0]){
                        NSLog(@"Found the proceeding space");
                        NSRange temprange;
                        temprange.location = 1;
                        temprange.length = word.length -1;
                        temp = [temp substringWithRange:temprange];
                    }
                    //    word.location ++;
               //     NSLog(@"%@~~~%@", temp, [inFileContents substringWithRange:key]);
                    Word *newWord = [[Word alloc]initWithKey: [inFileContents substringWithRange:key] andWord:temp];
                    
                    [input addObject:newWord];
                   // NSLog(@"%@~~~%@", [newWord getKey], [newWord getValue]);

                    NSLog(@"%lu: %@~~~", [input count],
                          
                          [[input objectAtIndex:[input count]-1] getKey]
                          );//, [[input objectAtIndex:[input count]-1] getValue]);

                    //[input setValue:temp forKey:[inFileContents substringWithRange:key]];
                }
                
                keystart = i + 1;
                keyFound = NO;
            }
            
        }
        //Read the data from the file and store it into a buffer
        //Convert the buffer into an NSString type
        //Output the file contents to the log to check it
        

          //  NSLog(@"%i",[input count]);
        
        //File 1 starting at the top left and moving down and right
       /* i = 0;
        for(int j = 0; j < 32; j++){
            for(int k = 0; k < 48; k++){
                //If there's an endline, increment
                if('\n' == [inFileContents characterAtIndex:i])
                    i++;
                //If there is a 'Y' add "YES" to the file
                if('Y' == [inFileContents characterAtIndex:i]){
                    fileContents = [fileContents stringByAppendingString:[NSString stringWithFormat:@"."]];
                    [lineContents stringByAppendingString:@"Y"];
                    
                } else{     //... else add "NO"
                    fileContents = [fileContents stringByAppendingString:[NSString stringWithFormat:@"-"]];
                    [lineContents stringByAppendingString:@"N"];
                }
                i++;    //increment index of the input string
            }
            fileContents = [fileContents stringByAppendingString:@"\n"];
            NSLog(@"%@", lineContents);
            lineContents = @"";
        }
        
        //Writing the result to the output file
        [fileContents writeToFile:fileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
        */
        NSLog(@"Progam finished executing.");
    }
    return;
}


@end
