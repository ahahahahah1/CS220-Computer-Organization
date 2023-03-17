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
    int i, j, k;

    float arr[8] = {0.123, 0.2735, 0.372, 0.1532, 0.1425, 0.2456, 0.314, 0.572}, bucket[8];
    float temp[10][8] = {0};
    int indices[10] = {0};
    int which_bucket = 0, which_index = 0;

    for(i = 0; i < 8; i++) {

        which_bucket = 10 * arr[i];
        which_index = indices[which_bucket];

        temp[which_bucket][which_index] = arr[i];
        indices[which_bucket]++;
    }

    for(i = 1; i < 6; i++) {
        insertionSort(temp[i], indices[i]);
    }

    which_index = 0;

    for(i = 0; i < 10; i++) {
        for(j = 0; j < indices[i]; j++) {
            bucket[which_index] = temp[i][j];
            which_index++;
        }
    }

    for(i = 0; i < 8; i++) {
        printf("%f ", bucket[i]);
    }
    printf("\n");

    return 0;
}