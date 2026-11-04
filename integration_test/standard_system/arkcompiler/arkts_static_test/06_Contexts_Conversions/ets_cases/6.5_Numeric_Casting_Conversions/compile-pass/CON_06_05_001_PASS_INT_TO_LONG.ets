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
 * @id CON_06_05_001_PASS_INT_TO_LONG
 * @expect compile-pass
 * @section 6.5
 * @design int.toLong() 标准库转换方法
 * @note 正向用例：使用 .toLong() 进行数值转换
 */
function testIntToLong(): void {
  let i: int = 42
  let l: long = i.toLong()
}
