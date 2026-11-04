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
 * @id CON_06_03_018_FAIL_STRING_ENUM_BITWISE
 * @expect compile-fail
 * @section 6.3
 * @design string 基类型枚举参与位运算: string enum | int, 应编译失败
 * @note 反向用例：string 枚举用于位运算应编译失败
 */
enum StatusCode {
  OK = 'ok',
  Error = 'error'
}

function testStringEnumBitwiseFail(): void {
  let r: int = StatusCode.OK | 1
}
