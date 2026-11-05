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
 * @id CLS_09_07_017_FAIL_NON_VOID_MISSING_RETURN
 * @expect compile-fail
 * @section 9.7.7
 * @design 非void返回类型方法必须在所有执行路径上有return语句
 * @note 反向用例：if无else分支、switch无default、循环可能不执行的路径缺少return
 */
class MissingReturnPath017 {
  // Error: no return on the else path
  conditionalOnly(flag: boolean): int {
    if (flag) {
      return 1
    }
  }

  // Error: return only inside if, no return after if block
  maybeReturn(val: int): string {
    if (val > 0) {
      return "positive"
    }
  }

  // Error: for loop may not execute, no return after loop
  loopReturn(n: int): int {
    for (let i: int = 0; i < n; i++) {
      return i
    }
  }
}

abstract class AbstractMissingReturn017 {
  // Error: no return on the else execution path
  compute(flag: boolean): double {
    if (flag) {
      return 3.14
    } else {
      let x: double = 2.71
    }
  }
}
