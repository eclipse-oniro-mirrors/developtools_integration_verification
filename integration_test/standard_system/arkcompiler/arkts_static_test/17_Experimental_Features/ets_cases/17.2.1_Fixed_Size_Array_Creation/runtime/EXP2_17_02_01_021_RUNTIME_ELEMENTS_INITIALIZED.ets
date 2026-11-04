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
 * @id EXP2_17_02_01_021_RUNTIME_ELEMENTS_INITIALIZED
 * @expect runtime
 * @section 17.2.1
 * @design 运行时验证 FixedArray 构造函数将所有元素初始化为给定值
 * @note 运行时用例：验证 new Fixedstring[](3, "hello") 中 a[0], a[1], a[2] 均为 "hello"
 */
function main(): void {
  let a: Fixedstring[] = new Fixedstring[](3, 'hello')
  if (a[0] != 'hello') {
    throw new Error("assertion failed: a[0] expected 'hello', got '" + a[0] + ''')
  }
  if (a[1] != 'hello') {
    throw new Error("assertion failed: a[1] expected 'hello', got '" + a[1] + ''')
  }
  if (a[2] != 'hello') {
    throw new Error("assertion failed: a[2] expected 'hello', got '" + a[2] + ''')
  }

  let b: Fixedint[] = new Fixedint[](4, 99)
  if (b[0] != 99) {
    throw new Error('assertion failed: b[0] expected 99')
  }
  if (b[1] != 99) {
    throw new Error('assertion failed: b[1] expected 99')
  }
  if (b[2] != 99) {
    throw new Error('assertion failed: b[2] expected 99')
  }
  if (b[3] != 99) {
    throw new Error('assertion failed: b[3] expected 99')
  }
  console.log('verified')
}
