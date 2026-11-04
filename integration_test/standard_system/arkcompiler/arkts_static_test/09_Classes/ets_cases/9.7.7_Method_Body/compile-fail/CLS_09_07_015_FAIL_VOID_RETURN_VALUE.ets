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
 * @id CLS_09_07_015_FAIL_VOID_RETURN_VALUE
 * @expect compile-fail
 * @section 9.7.7
 * @design void返回类型方法不允许return带表达式；void方法只允许return;或无return
 * @note 反向用例：void方法使用return带值导致编译失败
 */
class VoidReturnViolation015 {
  // Error: void method cannot return a value
  badReturnInt(): void {
    return 42
  }

  // Error: void method cannot return a string value
  badReturnString(): void {
    return "hello"
  }

  // Error: void method cannot return a boolean value
  badReturnBool(): void {
    return true
  }
}

abstract class VoidAbstractViolation015 {
  // Error: abstract void method cannot return a value in a concrete subclass context
  // But abstract with semicolon is fine - the error is in the concrete override below

  abstract fine(): void
}

class Concrete015 extends VoidAbstractViolation015 {
  // Error: void override cannot return a value
  override fine(): void {
    return 0
  }
}
