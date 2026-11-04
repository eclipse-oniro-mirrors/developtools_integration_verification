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
 * @id EXP_07_15_013_RUNTIME_BASIC_NEW
 * @expect runtime
 * @section 7.15
 * @design 验证 new A(42) 运行时构造器正确初始化字段值
 * @note 运行时用例：带参数构造器初始化验证
 */
class A {
  public val: int
  constructor(v: int) {
    this.val = v
  }
}

function main(): void {
  let a = new A(42)
  if (a.val != 42) {
    throw new Error('assertion failed: expected 42, got ' + a.val)
  }
console.log('verified')
}
