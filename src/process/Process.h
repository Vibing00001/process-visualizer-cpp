#pragma once

#include "raylib.h"
#include <string>

struct Process {
    int pid;
    int ppid;
    std::string name;
    Vector3 pos;

    float cpuUsage = 0.0f;
    float memoryMB = 0.0f;
};
