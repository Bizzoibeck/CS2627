#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int64_t is_sorted(int64_t* array, uint64_t num_elements);

int testcase_a(void) {
	int64_t array[0];
	int64_t res = is_sorted(array, 0);
	if(!res) {
		printf("Error in a\nArrays of length zero are sorted trivially.\n");
		return 1;
	}
	return 0;
}

int testcase_b(void) {
	int64_t array[1] = {0};
	int64_t res = is_sorted(array, 1);
	if(!res) {
		printf("Error in b\nArrays of length one are sorted trivially.\n");
		return 1;
	}
	return 0;
}

int testcase_c(void) {
	int64_t array[5] = {0, 1, 2, 3, 4};
	int64_t res = is_sorted(array, 5);
	if(!res) {
		printf("Error in c\nThis array is sorted.\n");
		return 1;
	}
	return 0;
}

int testcase_d(void) {
	int64_t array[5] = {0, 2, 2, 3, 4};
	int64_t res = is_sorted(array, 5);
	if(!res) {
		printf("Error in d\nThis array is sorted.\n");
		return 1;
	}
	return 0;
}

int testcase_e(void) {
	int64_t array[5] = {0, 2, 1, 3, 4};
	int64_t res = is_sorted(array, 5);
	if(res) {
		printf("Error in e\nThis array is not sorted.\n");
		return 1;
	}
	return 0;
}

int testcase_f(void) {
	int64_t array[5] = {0, 1, 2, 3, -4};
	int64_t res = is_sorted(array, 5);
	if(res) {
		printf("Error in f\nThis array is not sorted.\n");
		return 1;
	}
	return 0;
}

int testcase_g(void) {
	int64_t array[7] = {0, 1, 2, 3, 4, ((uint64_t)1)<<40, INT64_MAX};
	int64_t res = is_sorted(array, 7);
	if(!res) {
		printf("Error in g\nThis array is sorted.\n");
		return 1;
	}
	return 0;
}

int testcase_h(void) {
	int64_t array[5] = {-4, -3, -2, -1, 5};
	int64_t res = is_sorted(array, 5);
	if(!res) {
		printf("Error in g\nThis array is sorted.\n");
		return 1;
	}
	return 0;
}

int main() {

	int results[8];
	int(*testcases[8])(void) = {
		testcase_a,
		testcase_b,
		testcase_c,
		testcase_d,
		testcase_e,
		testcase_f,
		testcase_g,
		testcase_h
	};

	int num_failed = 0;

	for(size_t i = 0; i < 8; i++) {
		results[i] = testcases[i]();

		num_failed += results[i];
	}

	if(num_failed == 0) {
		printf("Everything passed! Congratulations!\n");
	} else {
		printf("\n\n%i tests failed\n", num_failed);
	}

}
