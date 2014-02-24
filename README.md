OCParentalGate
==============

Block-based parental gate for iOS apps made for kids. As of iOS 7, apps targeted for kids must implement a parental gate before allowing the user to link out of the app or engage in commerce (i.e. in-app purchases).

Implement a parental gate with just one line of code. 
`+ (void)presentParentalGateWithBlock:(void(^)(BOOL success))block;`

Example: 
```objectivec 
[OCParentalGate presentParentalGateWithBlock:^(BOOL success) {
   if (success) {
      // Do something
   }
}];
```
