#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int64_t dot_product(int64_t* a, int64_t* b, uint64_t num_elements);

int testcase_a(void) {

	int64_t a[] = {1};
	int64_t b[] = {1};
	uint64_t num_elements = 1;
	int64_t result = 1;
	int64_t test_result = dot_product(a, b, num_elements);
	if(test_result != result) {
		printf("Error: Result should be %li, but is %li\n", result, test_result);
		return 1;
	}
	return 0;
}

int testcase_b(void) {

	int64_t a[] = {2, 4};
	int64_t b[] = {8, 16};
	uint64_t num_elements = 2;
	int64_t result = 80;
	int64_t test_result = dot_product(a, b, num_elements);
	if(test_result != result) {
		printf("Error: Result should be %li, but is %li\n", result, test_result);
		return 1;
	}
	return 0;
}

int testcase_c(void) {

	int64_t a[] = {25, 36, 49};
	int64_t b[] = {11, 41, -13};
	uint64_t num_elements = 3;
	int64_t result = 1114;
	int64_t test_result = dot_product(a, b, num_elements);
	if(test_result != result) {
		printf("Error: Result should be %li, but is %li\n", result, test_result);
		return 1;
	}
	return 0;
}

int main() {

	int results[3];
	int(*testcases[3])(void) = {testcase_a, testcase_b, testcase_c};

	int num_failed = 0;

	for(size_t i = 0; i < 3; i++) {
		results[i] = testcases[i]();

		num_failed += results[i];
	}

	if(num_failed == 0) {
		printf("Everything passed! Congratulations!\n");
	} else {
		printf("\n\n%i tests failed\n", num_failed);
	}

}
