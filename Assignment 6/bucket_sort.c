#include <stdio.h>


void insertionSort(float arr[], int n)
{
    float key;
    int i, j;
    for (i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;
        
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
} 

int main() {
    int p, i, j;
    printf("Enter the size of the array to be sorted:\n");
    scanf("%d", &p);

    int n = 10;

    float arr[p], bucket[p];
    float temp[n][p];
    int indices[10] = {0};
    int which_bucket, which_index;

    printf("Enter the numbers:\n");
    for(i = 0; i < p; i++) {
        scanf("%f", &arr[i]);

        which_bucket = n * arr[i];
        which_index = indices[which_bucket];

        temp[which_bucket][which_index] = arr[i];
        indices[which_bucket]++;

    }

    for(i = 0; i < n; i++) {
        insertionSort(temp[i], indices[i]);
    }

    which_index = 0;

    for(i = 0; i < n; i++) {
        for(j = 0; j < indices[i]; j++) {
            bucket[which_index] = temp[i][j];
            which_index++;
        }
    }

    for(i = 0; i < p; i++) {
        printf("%f ", bucket[i]);
    }

    return 0;
}