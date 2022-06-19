#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

bool isPrime(int numero)
{
    bool primo = true;
    if(numero<2)primo = false;
    else{
        for(int x=2; x*x<=numero; x++){
            if( numero%x==0 ){
                primo = false;
                break;
            }
        }
    }
    return primo;
}
int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    int n, number;

    cin>>n;
    
    int numbers[n];
    bool aux[n];
    
    for(int i=0; i<n; i++){
        cin>>number;
        if(isPrime(number)) cout<<"Prime"<<endl;
        else cout<<"Not prime"<<endl;
    }
    return 0;
}
