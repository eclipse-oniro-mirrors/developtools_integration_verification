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
 * @id EXP_07_11_04_002_PASS_INSTANCE_VOID_AS_STATEMENT
 * @expect compile-pass
 * @section 7.11.4
 * @design 验证 instance void 方法作为表达式语句调用，编译通过
 * @note 正向用例：实例 void 方法调用作为独立语句（new A().method()），编译通过
 */
class Printer {
  print(): void {
    let text: string = 'world';
  }
}

function main(): void {
  let p: Printer = new Printer();
  p.print();
}
