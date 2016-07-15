#include <unistd.h>
    int c;
    const char* param = "c:f:t:b:xl:h";
    while ((c = getopt(argc, argv, param)) != -1) {
        switch(c) {
            case 'c':
                // conf_file_name = optarg;
                break;
            case 'f':
                break;
            case 't':
                break;
            case 'b':
                break;
            case 'x':
                break;
            case 'l':
                break;
            case 'h':
            case '?':
                fprintf(stderr, "Usage: %s -[%s]\n", argv[0], param);
                return 0;
        }
    }
