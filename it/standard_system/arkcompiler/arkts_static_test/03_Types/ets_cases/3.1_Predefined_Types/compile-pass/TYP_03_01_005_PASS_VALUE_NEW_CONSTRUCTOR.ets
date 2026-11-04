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
 * @id TYP_03_01_005_PASS_VALUE_NEW_CONSTRUCTOR
 * @expect compile-pass
 * @section 3.1
 * @design 使用 new 构造函数创建值类型实例: new int/new byte/new short/new long/new float/new double/new number/new boolean
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testNewValueTypes(): void {
  let a: int = new int()
  let b: byte = new byte()
  let c: short = new short()
  let d: long = new long()
  let e: float = new float()
  let f: double = new double()
  let g: number = new number()
  let h: boolean = new boolean()
}