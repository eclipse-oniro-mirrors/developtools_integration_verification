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
 * @id CLS_09_07_009_FAIL_MISSING_RETURN_AND_BODY
 * @expect compile-fail
 * @section 9.7.7
 * @design 方法体违规：非void返回类型缺少return语句；abstract方法有block体；非abstract/native方法无体
 * @note 反向用例：方法体规则违规
 */
abstract class Base009 {
  abstract good(): int
}

class BadMethodBody009 extends Base009 {
  // Error: non-abstract, non-native method has semicolon (empty body)
  good(): int;

  // Error: return type int but no return on the else execution path
  conditionalReturn(flag: boolean): int {
    if (flag) {
      return 1
    }
  }
}

abstract class BadAbstract009 {
  // Error: abstract method with block body
  abstract hasBody(): void {
    let x: int = 0
  }
}
