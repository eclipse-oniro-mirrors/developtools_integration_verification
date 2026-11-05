/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * @id STMT_08_01_013_PASS_return_abrupt_nested
 * @expect compile-pass
 * @section 8.1
 * @design 验证 return 语句在嵌套控制流结构（if-else内、循环内、try块内、嵌套if内）中触发异常完成的编译通过
 * @note return 在任何嵌套深度的块内出现都会导致整个函数异常完成，所有嵌套层级均合法
 */

function returnInsideIfElse(flag: boolean): int {
  if (flag) {
    return 10;
  } else {
    return 20;
  }
}

function returnInsideLoop(values: int[]): int {
  let sum: int = 0;
  for (let i: int = 0; i < values.length; i++) {
    if (values[i] < 0) {
      return -1;
      // abrupt completion exits function from inside loop + if
    }
    sum = sum + values[i];
  }
  return sum;
}

function returnInsideTryBlock(): int {
  try {
    let x: int = 42;
    if (x > 0) {
      return x;
      // abrupt completion from inside try -> if
    }
  } catch (e) {
    return -1;
    // abrupt completion from inside catch
  }
  return 0;
}

function returnInsideNestedIf(a: int, b: int, c: int): int {
  if (a > 0) {
    if (b > 0) {
      if (c > 0) {
        return 1;
      }
      return 2;
    }
    return 3;
  }
  return 4;
}

function returnInsideSwitch(val: int): int {
  switch (val) {
    case 1: {
      return 10;
    }
    case 2: {
      return 20;
    }
    default: {
      return 0;
    }
  }
}
