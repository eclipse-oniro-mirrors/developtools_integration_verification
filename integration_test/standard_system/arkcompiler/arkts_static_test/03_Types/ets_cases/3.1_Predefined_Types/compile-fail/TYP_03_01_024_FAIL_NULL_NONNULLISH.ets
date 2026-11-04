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
 * @id TYP_03_01_024_FAIL_NULL_NONNULLISH
 * @expect compile-fail
 * @section 3.1
 * @design null 赋值给非空类型应编译失败: null 赋值给 int/string/boolean/double/Object，字段初始化为 null，函数参数传 null
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testNullNonNullishFail(): void {
  let n: int = null
  let s: string = null
  let b: boolean = null
  let d: double = null
  let o: Object = null
}

class TestNullFieldFail {
  fieldValue: int = null
}

function testNullParamFail(p: string): void {}
function caller(): void {
  testNullParamFail(null)
}