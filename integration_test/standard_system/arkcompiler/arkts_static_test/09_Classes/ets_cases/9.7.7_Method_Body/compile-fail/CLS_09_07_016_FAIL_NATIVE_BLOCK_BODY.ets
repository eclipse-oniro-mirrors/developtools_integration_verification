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
 * @id CLS_09_07_016_FAIL_NATIVE_BLOCK_BODY
 * @expect compile-fail
 * @section 9.7.7
 * @design native方法必须为空体（分号或无体），不允许block体实现
 * @note 反向用例：native方法使用block体导致编译失败
 */
class NativeBlockBody016 {
  // Error: native method must not have a block body
  native compute(a: int, b: int): int {
    return a + b
  }
}

abstract class NativeAbstract016 {
  // Error: native method must not have a block body, even in abstract class
  native fetch(): string {
    return "data"
  }
}

class NativeMultiViolation016 {
  // Error: native method with block body returning void
  native log(msg: string): void {
    let prefix: string = "[NATIVE]"
  }
}
