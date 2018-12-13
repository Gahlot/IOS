//
//  main.c
//  Sort
//
//  Created by Mahesh Gahlot on 10/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

#include <stdio.h>

int partition(int arr[],int l,int r){
    int piv = arr[r];
    int i=l-1;
    for(int j=l;j<r;j++){
        if(arr[j]<piv){
            i++;
            int temp=arr[j];
            arr[j]=arr[i];
            arr[i]=temp;
        }
    }
    
    arr[r]=arr[i+1];
    arr[i+1]=piv;
    return i+1;
}
void quickSort(int arr[],int l,int r){
    if(l<r){
        
        int pivoit = partition(arr,l,r);
        
        quickSort(arr,l,pivoit-1);
        quickSort(arr,pivoit,r);
        
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    int arr[5];
    for(int i=0;i<5;i++){
        scanf("%d",&arr[i]);
    }
    quickSort(arr,0,4);
    printf("\nAFTER SORT:");
    for(int i=0;i<5;i++){
        printf(" %d ",arr[i]);
    }
    return 0;
}
