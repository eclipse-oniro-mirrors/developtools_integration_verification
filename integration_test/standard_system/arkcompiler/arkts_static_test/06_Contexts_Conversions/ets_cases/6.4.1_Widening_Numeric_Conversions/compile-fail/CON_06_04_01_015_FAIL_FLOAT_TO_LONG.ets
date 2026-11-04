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
 * @id CON_06_04_01_015_FAIL_FLOAT_TO_LONG
 * @expect compile-fail
 * @section 6.4.1
 * @design float→long 非 widening 路径，应编译失败
 * @note 反向用例：非 widening 方向不应编译通过
 */
function testFloatToLongFail(): void {
  let f: float = 3.14
  let l: long = f
}
