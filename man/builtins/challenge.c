#include "loadables.h"
#include "bashansi.h"
#include <config.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

#ifndef SECRET_VALUE
#define SECRET_VALUE "asdf"
#endif

int challenge_builtin(WORD_LIST *list)
{
	if (!list)
	{
		puts("Incorrect usage! Please read the help page for the challenge builtin!");
		return EXECUTION_FAILURE;
	}

	if (!strcmp(list->word->word, "--fortune"))
	{
		system("/usr/games/fortune");
	}
	else if (!strcmp(list->word->word, "--version"))
	{
		puts("I'm exactly the version I need to be!");
	}
	else if (!strcmp(list->word->word, "--secret"))
	{
		if (!list->next)
		{
			puts("ERROR: missing argument to --secret.");
			return EXECUTION_FAILURE;
		}
		if (strcmp(list->next->word->word, SECRET_VALUE))
		{
			puts("ERROR: incorrect argument to --secret. Read the help!");
			return EXECUTION_FAILURE;
		}
		puts("Correct! Here is your flag!");

		if (!find_variable("FLA") || !find_variable("FLB"))
		{
			puts("ERROR: environment problem. NOT YOUR FAULT; report this to discord.");
			return EXECUTION_FAILURE;
		}

		char flag_path[1024];
		sprintf(flag_path, "/tmp/.%s-%s", get_variable_value(find_variable("FLA")), get_variable_value(find_variable("FLB")));
		char flag[1024] = { 0 };
		int fd = open(flag_path, 0);
		read(fd, flag, 1024);
		puts(flag);
	}
	else
	{
		puts("Incorrect usage! Please read the help page for the challenge builtin!");
		return EXECUTION_FAILURE;
	}

  	return EXECUTION_SUCCESS;
}

int challenge_builtin_load(char *name)
{
  	//bind_global_variable("PWN", "COLLEGE", 0);
  	return (1); // 0 == fail
}

void challenge_builtin_unload(char *name)
{
}

char *challenge_doc[] = {
	"This builtin command will read you the flag, given the right arguments!",
	(
	 ""
	 "\n"
	 "    Options:\n"
	 "      --fortune		display a fortune\n"
	 "      --version		display the version\n"
	 "      --secret VALUE	prints the flag, if VALUE is correct\n"
	 "\n"
	 "    You must be sure to provide the right value to --secret. That value\n"
	 "    is \"" SECRET_VALUE "\"."
	),
	(char *)NULL
};

struct builtin challenge_struct = {
	"challenge",			/* builtin name */
	challenge_builtin,		/* function implementing the builtin */
	BUILTIN_ENABLED,		/* initial flags for builtin */
	challenge_doc,			/* array of long documentation strings. */
	"challenge [--fortune] [--version] [--secret SECRET]",			/* usage synopsis; becomes short_doc */
	0				/* reserved for internal use */
};
