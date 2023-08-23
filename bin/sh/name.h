/*
 * UNIX shell
 *
 * Bell Telephone Laboratories
 */
#ifndef _NAME_H_
#define _NAME_H_

#define N_ENVCHG 0020
#define N_RDONLY 0010
#define N_EXPORT 0004
#define N_ENVNAM 0002
#define N_FUNCTN 0001

#define N_DEFAULT 0

struct namnod {
	struct namnod *namlft;
	struct namnod *namrgt;
	char *namid;
	char *namval;
	char *namenv;
	int namflg;
};

int syslook(char *w, struct sysnod syswds[], int n);

#endif