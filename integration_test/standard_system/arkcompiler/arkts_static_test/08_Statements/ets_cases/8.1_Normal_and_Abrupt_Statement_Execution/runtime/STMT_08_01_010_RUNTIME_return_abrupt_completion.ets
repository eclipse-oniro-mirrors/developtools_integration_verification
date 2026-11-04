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
 * @id STMT_08_01_010_RUNTIME_return_abrupt_completion
 * @expect runtime
 * @section 8.1
 * @design 验证 return 语句触发异常完成 (abrupt completion)：函数内 return 之后的代码不执行，调用方获得正常控制权
 * @note return 是 abrupt completion 的一种形式；函数一旦执行 return，剩余语句体被跳过
 */

function helperReturnEarly(flag: boolean): int {
  let value: int = 0;
  if (flag) {
    return 1;
    // return causes abrupt completion — following assignment never executes
  }
  value = 2;
  return value;
}

function helperReturnInLoop(max: int): int {
  let sum: int = 0;
  for (let i: int = 0; i < max; i++) {
    if (i == 3) {
      return sum;
      // abrupt completion exits the entire function, not just the loop
    }
    sum = sum + i;
  }
  return -1;
}

function helperReturnInTry(): int {
  let marker: int = 0;
  try {
    marker = 1;
    return 42;
    // abrupt completion — code below is unreachable
  } catch (e) {
    marker = 99;
  }
  return marker;
}

function main(): void {
  // Test 1: return in if-else causes abrupt completion
  let r1: int = helperReturnEarly(true);
  if (r1 != 1) {
    throw new Error("return abrupt: expected 1 but got " + r1);
  }
  let r2: int = helperReturnEarly(false);
  if (r2 != 2) {
    throw new Error("return abrupt: expected 2 but got " + r2);
  }

  // Test 2: return inside loop causes abrupt completion of the entire function
  let r3: int = helperReturnInLoop(10);
  // sum = 0+1+2 = 3, returns at i==3
  if (r3 != 3) {
    throw new Error("return in loop abrupt: expected 3 but got " + r3);
  }

  // Test 3: return inside try block — abrupt completion, finally would still run
  let r4: int = helperReturnInTry();
  if (r4 != 42) {
    throw new Error("return in try abrupt: expected 42 but got " + r4);
  }

  console.log("verified");
}
