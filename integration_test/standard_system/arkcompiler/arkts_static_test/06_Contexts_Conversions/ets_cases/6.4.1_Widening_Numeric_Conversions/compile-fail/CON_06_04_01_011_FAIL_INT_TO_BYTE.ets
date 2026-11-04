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
 * @id CON_06_04_01_011_FAIL_INT_TO_BYTE
 * @expect compile-fail
 * @section 6.4.1
 * @design int→byte 是 narrowing，无隐式 widening 转换，应编译失败
 * @note 反向用例：反向 narrowing 不应编译通过
 */
function testIntToByteFail(): void {
  let i: int = 10
  let b: byte = i
}
