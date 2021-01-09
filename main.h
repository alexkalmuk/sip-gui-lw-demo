#ifndef __MAIN_H__
#define __MAIN_H__

enum call_state {
	CALL_INACTIVE,
	CALL_INCOMING,
	CALL_ACTIVE,
};

struct demo_call_info {
	enum call_state state;

	char incoming[128];
	char remote_uri[64];
	char remote_contact[64];
};

extern int demo_pj_main(int argc, char *argv[], int (*nk_cb)(void));
extern void demo_pj_answer(void);
extern void demo_pj_hang(void);

extern int demo_nk_main(void);

#endif /* __MAIN_H__ */
