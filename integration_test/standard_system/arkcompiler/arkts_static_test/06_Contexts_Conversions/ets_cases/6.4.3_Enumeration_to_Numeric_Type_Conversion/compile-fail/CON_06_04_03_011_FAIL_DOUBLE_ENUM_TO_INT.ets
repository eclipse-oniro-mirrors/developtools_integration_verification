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
 * @id CON_06_04_03_011_FAIL_DOUBLE_ENUM_TO_INT
 * @expect compile-fail
 * @section 6.4.3
 * @design double 基类型枚举→int (不兼容类型), 应编译失败
 * @note 反向用例：double 枚举不能转为 int
 */
enum DoubleE: double { a = 1.0, b = 2.0 }

function testDoubleEnumToIntFail(): void {
  let e: DoubleE = DoubleE.a
  let v: int = e
}
