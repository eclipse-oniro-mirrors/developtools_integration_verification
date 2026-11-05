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
 * @id CON_06_03_017_FAIL_BOOL_SHIFT
 * @expect compile-fail
 * @section 6.3
 * @design 布尔值参与移位: boolean << int, 非数值类型，应编译失败
 * @note 反向用例：非数值类型用于移位运算应编译失败
 */
function testBoolShiftFail(): void {
  let b: boolean = true
  let n: int = 2
  let r: int = b << n
}
