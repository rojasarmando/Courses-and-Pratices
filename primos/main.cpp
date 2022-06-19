#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

bool isPrime(int num) {

  if (num == 0 || num == 1 || num == 4)
    return false;
  for (int x = 2; x < num / 2; x++) 
    if (num % x == 0) return false;
  
  return true;
}

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    int n; 
    cin>>n;
    
    for(int i = 0; i<n; i++){
        
        int num;
        cin>>num;
        
        if(isPrime(num)) cout<<"Prime"<<endl;
        else cout<<"Not prime"<<endl;
            
    }
    return 0;
}

