#include <stdio.h>
#include <stdlib.h>

#include "main.h"

struct demo_call_info *call_info;

int main(int argc, char *argv[]) {
	call_info = malloc(sizeof (struct demo_call_info));

	demo_pj_main(argc, argv, demo_nk_main);

	//demo_nk_main();

	free(call_info);

	return 0;
}
