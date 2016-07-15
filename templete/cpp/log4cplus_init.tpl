#include "rd_logger.h"

    const char* log_conf_path = "conf/log4cplus.properties";
    if (rd::init_log(log_conf_path) != 0) {
        std::cerr << "Exception occured while init_log()" << std::endl;
        return 1;
    }

    INFO_LOG("init_log end");
