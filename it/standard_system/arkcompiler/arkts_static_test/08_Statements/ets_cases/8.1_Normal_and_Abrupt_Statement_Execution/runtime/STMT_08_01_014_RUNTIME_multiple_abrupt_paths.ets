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
 * @id STMT_08_01_014_RUNTIME_multiple_abrupt_paths
 * @expect runtime
 * @section 8.1
 * @design 验证同一函数体内存在多条可能的异常完成路径时，运行时实际命中的路径产生正确的异常完成行为
 * @note 多个 abrupt 源共存时，控制流按序执行，第一个被命中的 abrupt 语句决定实际的完成方式
 */

// Helper: multiple return paths — verify the correct one is taken
function selectReturnPath(selector: int): int {
  if (selector == 0) {
    return 100;
  }
  if (selector == 1) {
    return 200;
  }
  if (selector == 2) {
    return 300;
  }
  return -1;
}

// Helper: throw vs return — whichever is hit first determines behavior
function throwOrReturn(val: int): int {
  if (val < 0) {
    throw new Error("negative value");
    // abrupt completion via throw
  }
  if (val == 0) {
    return 0;
    // abrupt completion via return
  }
  return val * 2;
  // normal return
}

// Helper: break vs return inside loop
function breakOrReturnInLoop(mode: int): int {
  let result: int = 0;
  for (let i: int = 0; i < 10; i++) {
    if (mode == 1 && i == 2) {
      return i;
      // abrupt completion of function via return
    }
    if (mode == 2 && i == 3) {
      break;
      // abrupt completion of loop via break
    }
    result = result + i;
  }
  return result;
  // normal completion after loop
}

function main(): void {
  // Test 1: multiple return paths — correct path selected
  let r1a: int = selectReturnPath(0);
  if (r1a != 100) {
    throw new Error("multiple paths: expected 100 but got " + r1a);
  }
  let r1b: int = selectReturnPath(1);
  if (r1b != 200) {
    throw new Error("multiple paths: expected 200 but got " + r1b);
  }
  let r1c: int = selectReturnPath(2);
  if (r1c != 300) {
    throw new Error("multiple paths: expected 300 but got " + r1c);
  }
  let r1d: int = selectReturnPath(99);
  if (r1d != -1) {
    throw new Error("multiple paths: expected -1 but got " + r1d);
  }

  // Test 2: throw vs return — throw path
  let threw: boolean = false;
  try {
    throwOrReturn(-5);
  } catch (e) {
    threw = true;
  }
  if (threw != true) {
    throw new Error("multiple paths: expected throw to fire for negative value");
  }

  // Test 3: throw vs return — return path
  let r3: int = throwOrReturn(0);
  if (r3 != 0) {
    throw new Error("multiple paths: expected 0 but got " + r3);
  }
  let r3b: int = throwOrReturn(7);
  if (r3b != 14) {
    throw new Error("multiple paths: expected 14 but got " + r3b);
  }

  // Test 4: break vs return in loop — return takes precedence (exits function)
  let r4a: int = breakOrReturnInLoop(1);
  // mode==1: return at i==2, result was 0+0+1=1 before hitting return at i==2
  if (r4a != 2) {
    throw new Error("multiple paths: return in loop expected i=2 but got " + r4a);
  }

  // Test 5: break vs return in loop — break only exits loop, then normal return
  let r5: int = breakOrReturnInLoop(2);
  // mode==2: break at i==3, result = 0+0+1+2 = 3
  if (r5 != 3) {
    throw new Error("multiple paths: break in loop expected sum=3 but got " + r5);
  }

  // Test 6: normal loop path
  let r6: int = breakOrReturnInLoop(0);
  // mode==0: no break/return, result = sum(0..9) = 45
  if (r6 != 45) {
    throw new Error("multiple paths: normal loop expected sum=45 but got " + r6);
  }

  console.log("verified");
}
