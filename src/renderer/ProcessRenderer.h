#pragma once

#include <vector>
#include "../process/Process.h"

class ProcessRenderer {
  public:
    void render(const std::vector<Process>& processes) const;
};
