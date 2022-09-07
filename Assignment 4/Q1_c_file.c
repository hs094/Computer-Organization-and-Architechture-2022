#include<stdio.h>
#include<stdlib.h>
int ** allocate(int);
void printMatrix(int, int**);
int determinant(int, int**);
void submatrix(int, int **, int, int**);

int main(){
    int n,a,r,m;    
    do{
        printf("Enter four positive integers (n, a, r and m) : ");
        scanf("%d%d%d%d", &n, &a, &r, &m);
    }
    while(n<=0 || a<=0 || r<=0 || m<=0);
    int **A = allocate(n);
    int a_ij=a%m;
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            A[i][j]=a_ij;
            a_ij=(a_ij*r)%m;
        }
    }
    printf("matrix A:\n");
    printMatrix(n,A);
    int det = determinant(n,A);
    printf("Final determinant of the matrix A is: %d\n", det);
    return 0;
}
int ** allocate(int n){
    int **A = (int **)malloc(n*sizeof(int*));
    for(int i=0; i<n; i++){
        A[i]=(int *)malloc(n*sizeof(int));
    }
    return A;
}
void printMatrix(int n , int **A){
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            printf("%d ", A[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}
int determinant(int n, int **A){
    if(n==1) return A[0][0];
    int **B = allocate(n-1);
    int det=0;
    for(int j=0; j<n; j++){
        submatrix(n, A, j, B);
        int M_ij = determinant(n-1, B);
        if(j&1) det-=A[0][j]*M_ij;
        else det+=A[0][j]*M_ij;
    }
    return det;
}

void submatrix(int n, int**A, int col, int **B){
    int k=0;
    for(int i=1; i<n; i++){
        for(int j=0; j<n; j++){
            if(j!=col){
                B[k/(n-1)][k%(n-1)]=A[i][j];
                k++;
            }  
        }
    }
}

