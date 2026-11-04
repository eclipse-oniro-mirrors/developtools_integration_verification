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
 * @id TYP_03_01_025_FAIL_STRING_ARITHMETIC
 * @expect compile-fail
 * @section 3.1
 * @design string 类型非法算术运算应编译失败: 字符串与数值做(- * /)运算、字符串赋值给非 string 类型
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testStringInvalidOpsFail(): void {
  let s: string = "hello"
  let diff: string = s - "world"
  let prod: string = s * 2
  let quot: string = s / "a"

  let n: int = s
}