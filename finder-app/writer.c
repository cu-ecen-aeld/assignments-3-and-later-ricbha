#include<stdio.h>
#include<syslog.h>
#include<stdlib.h>

int main(int argc, char* argv[])
{
	if(argc != 3) {
		printf("Usage: writer writefile writestr\n");
		return 1;
	}

	const char* writefile = argv[1];
	const char* writestr = argv[2];
	FILE* in_file = fopen(writefile, "w");

	openlog(NULL,0,LOG_USER);
	
	if (in_file == NULL)
	{
		syslog(LOG_ERR,"Unable to open file: %s", writefile);
	}
	else
	{
		syslog(LOG_DEBUG, "Writing %s to file %s", writestr, writefile);
		fprintf(in_file, writestr);
		syslog(LOG_DEBUG, "Completed writing to file: %s", writefile);
		fclose(in_file);
	}
}
