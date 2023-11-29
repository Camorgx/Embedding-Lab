#include<stdio.h>

typedef struct strings {
    int str_num;
    char *str[10];
} strings;

extern strings *sort(strings *arg);

int main() {
    int i;
    strings *res, input;
    char string[10][20];
    scanf("%d", &(input.str_num));
    for (i = 0; i < input.str_num; ++i) {
        scanf("%s", string[i]);
        input.str[i] = string[i];
    }
    res = sort(&input);
    for (i = 0; i < input.str_num; ++i)
        printf("%s\n", res->str[i]);
    return 0;
}

/*
strings *sort(strings *arg) {
    int i, j, k;
    char *temp;
    for (i = 0; i < arg->str_num; ++i) {
        for (j = arg->str_num - 1; j > i; --j) {
            for (k = 0; arg->str[j][k] == arg->str[j-1][k] && k < 20; ++k);
            if (arg->str[j][k] < arg->str[j-1][k]) {
                temp = arg->str[j];
                arg->str[j] = arg->str[j - 1];
                arg->str[j - 1] = temp;
            }
        }
    }
    return arg;
}
*/
