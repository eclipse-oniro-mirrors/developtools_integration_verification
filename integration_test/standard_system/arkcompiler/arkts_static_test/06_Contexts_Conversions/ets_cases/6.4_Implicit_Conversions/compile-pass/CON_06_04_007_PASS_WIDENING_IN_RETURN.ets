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
 * @id CON_06_04_007_PASS_WIDENING_IN_RETURN
 * @expect compile-pass
 * @section 6.4
 * @design Widening 在返回上下文中: return int 给 long/double 返回类型
 * @note 正向用例：验证 widening 在返回上下文中隐式生效
 */
function returnLong(): long {
  let a: int = 100
  return a
}

function returnDouble(): double {
  return 42
}

function testWideningInReturn(): void {
  let r1: long = returnLong()
  let r2: double = returnDouble()
}
