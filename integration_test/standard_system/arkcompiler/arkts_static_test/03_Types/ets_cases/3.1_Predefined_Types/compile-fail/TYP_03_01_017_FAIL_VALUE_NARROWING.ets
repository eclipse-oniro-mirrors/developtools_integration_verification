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
 * @id TYP_03_01_017_FAIL_VALUE_NARROWING
 * @expect compile-fail
 * @section 3.1
 * @design 隐式 narrowing 转换应编译失败: int→byte、int→short、long→int、double→float
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testNarrowingFail(): void {
  let i: int = 100
  let b: byte = i
  let s: short = i

  let l: long = 100
  let i2: int = l

  let d: double = 3.14
  let f: float = d
}