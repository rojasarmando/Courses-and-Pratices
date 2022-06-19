#include <iostream>

using namespace std;

struct Node{
    char character;
    Node *next;
};

class Solution {
    //Write your code here
    
    private:
    Node *stack;
    Node *queue;
    
    public:
    
    Node *createNode(char character);    
    void pushCharacter(char character);
    void enqueueCharacter(char character);
    char popCharacter();
    char dequeueCharacter();
};

Node *Solution::createNode(char character){
    Node *node = new Node;
    node->character = character;
    node->next = NULL;
    return node;
}

void Solution::pushCharacter(char character){
    
    if(this->stack == NULL){
        this->stack = this->createNode(character);
    }else{
        Node *tmp = this->createNode(character);
        tmp->next = this->stack;
        this->stack = tmp;
    }
}

void Solution::enqueueCharacter(char character){
    
     if(this->queue == NULL){
        this->queue = this->createNode(character);
    }else{
        Node *tmp = &*this->queue;
        while(tmp->next != NULL) tmp = tmp->next;
        tmp->next = this->createNode(character);
    } 
}
char Solution::popCharacter(){
    char result = ' ';
    
    if(this->stack != NULL){
        result = this->stack->character; 
        this->stack = this->stack->next;     
    }
    
    return result;
}

char Solution::dequeueCharacter(){
    char result = ' ';
    
    if(this->queue != NULL){
        
        if(this->queue->next == NULL){
            result = this->queue->character;
            this->queue = NULL;
        }else{
            Node *tmp = &*this->queue; 
            while(tmp->next->next != NULL) tmp = tmp->next;
            result = tmp->next->character;
            tmp = tmp->next = NULL;
            
        }
        result = this->queue->character; 
        this->queue = this->queue->next;     
    }
    
    return result;
}

int main() {
    // read the string s.
    string s;
    getline(cin, s);
    
  	// create the Solution class object p.
    Solution obj;
    
    // push/enqueue all the characters of string s to stack.
    for (int i = 0; i < s.length(); i++) {
        obj.pushCharacter(s[i]);
        obj.enqueueCharacter(s[i]);
    }
    
    bool isPalindrome = true;
    
    // pop the top character from stack.
    // dequeue the first character from queue.
    // compare both the characters.
    for (int i = 0; i < s.length() / 2; i++) {
        if (obj.popCharacter() != obj.dequeueCharacter()) {
            isPalindrome = false;
            
            break;
        }
    }
    
    // finally print whether string s is palindrome or not.
    if (isPalindrome) {
        cout << "The word, " << s << ", is a palindrome.";
    } else {
        cout << "The word, " << s << ", is not a palindrome.";
    }
    
    return 0;
}
