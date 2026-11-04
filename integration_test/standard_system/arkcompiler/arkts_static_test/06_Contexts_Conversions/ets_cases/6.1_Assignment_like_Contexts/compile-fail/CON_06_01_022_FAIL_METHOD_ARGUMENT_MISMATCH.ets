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
 * @id CON_06_01_022_FAIL_METHOD_ARGUMENT_MISMATCH
 * @expect compile-fail
 * @section 6.1
 * @design Call context: 方法调用实参类型(string)与形参类型(int)不匹配且无隐式转换
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Processor {
  process(count: int): void {
    let x: int = count
  }
}

function testMethodArgumentMismatchFail(): void {
  let proc: Processor = new Processor()
  proc.process('invalid')
}
