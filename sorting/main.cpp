#include <bits/stdc++.h>

using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    int numberOfSwaps = 0;
    
    for(int a_i = 0; a_i < n; a_i++){
    	cin >> a[a_i];
    }
    // Write Your Code Here
    for(int i=0; i<n; i++){ 
        
        int numberOfSwapsAux = 0;
        for(int j=0; j<(n-1); j++) { 
            if (a[j] > a[j+1]){ 
                swap(a[j], a[j+1]); 
                numberOfSwapsAux++; 
                numberOfSwaps++;
            }
        }
        if(numberOfSwapsAux == 0) break;   
    }
    cout<<"Array is sorted in "<<numberOfSwaps<<" swaps."<<endl;
    cout<<"First Element: "<<a[0]<<endl;
    cout<<"Last Element: "<<a[n-1]<<endl;
    
    return 0;
}
