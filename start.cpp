#include <iostream>

void modify(int &a, int b) {
  a += 10;
  b += 10;
}

int main() {
  int x = 5;
  int y = 5;

  modify(x, y);

  std::cout << x << " " << y << "\n";
}
