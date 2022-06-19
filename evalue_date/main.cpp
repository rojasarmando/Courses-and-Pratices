#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

struct date{
    int day, month, year;
};

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */ 
    date dateReturned;
    date dateDue;
    int fine = 0;
    
    cin>>dateReturned.day;
    cin>>dateReturned.month;
    cin>>dateReturned.year;
    
    cin>>dateDue.day;
    cin>>dateDue.month;
    cin>>dateDue.year;
    
    if(dateDue.year < dateReturned.year) 
        fine = 10000;
    else if(dateDue.month < dateReturned.month && (dateDue.year == dateReturned.year) )
        fine = 500 * (dateReturned.month - dateDue.month);
    else if(dateDue.day < dateReturned.day && (dateDue.month == dateReturned.month) && (dateDue.year == dateReturned.year) )
        fine = 15 * (dateReturned.day - dateDue.day);
    
    cout<<fine<<endl;
    return 0;
}

