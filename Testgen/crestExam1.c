/* Copyright (c) 2008, Jacob Burnim (jburnim@cs.berkeley.edu)
 *
 * This file is part of CREST, which is distributed under the revised
 * BSD license.  A copy of this license can be found in the file LICENSE.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See LICENSE
 * for details.
 */

#include <stdio.h>

int dbl(int x) {
  return 2*x;
}

int main(void) {
  int a;
  scanf("%d",&a);
  //CREST_int(a);
  if (dbl(a) + 3 == 9) {
    return 0;
  } else {
    return 1;
  }
}
