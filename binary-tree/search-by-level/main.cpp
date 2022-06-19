#include <iostream>
#include <cstddef>
#include <queue>
#include <string>
#include <cstdlib>

using namespace std;	
class Node{
    public:
        int data;
        Node *left,*right;
        Node(int d){
            data=d;
            left=right=NULL;
        }
};
class Solution{
    public:
  		Node* insert(Node* root, int data){
            if(root==NULL){
                return new Node(data);
            }
            else{
                Node* cur;
                if(data<=root->data){
                    cur=insert(root->left,data);
                    root->left=cur;
                }
                else{
                   cur=insert(root->right,data);
                   root->right=cur;
                 }           
           return root;
           }
        }

	void levelOrder(Node * root){
        
        if (!root)return;
        
        queue<pair<struct Node*, int> > q;
        q.push({root, 1});
        pair<struct Node*, int> p;
        
  
        // Do level Order Traversal of tree
        while (!q.empty()) {
            p = q.front();
            q.pop();
            cout <<p.first->data<<" ";
            if (p.first->left)
                q.push({ p.first->left, p.second + 1 });
            if (p.first->right)
                q.push({ p.first->right, p.second + 1 });
        }
	}
    
};//End of Solution
int main(){
    Solution myTree;
    Node* root=NULL;
    int T,data;
    cin>>T;
    while(T-->0){
        cin>>data;
        root= myTree.insert(root,data);
    }
    myTree.levelOrder(root);
    return 0;
}
