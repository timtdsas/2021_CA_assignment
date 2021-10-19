#include <stdio.h>
#include <limits.h>

int maxProfit(int* prices, int pricesSize){
    
    int min_price=INT_MAX;
    int p_gap=0;
    
    for (int i=0;i<pricesSize;i++){
          if(prices[i]<=min_price)
              min_price=prices[i]; //update min_price value
              
          if(prices[i]-min_price>=p_gap)
              p_gap=prices[i]-min_price; //update the newest price gap
    }
    
    return p_gap;
}

int main(){
  int prices[] = {7,1,5,3,6,4};
  printf("%d\n", maxProfit(prices,6));
  return 0;
}


