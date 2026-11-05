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
 * @id EXP2_17_08_011_FAIL_BREAK_OUTSIDE_LOOP
 * @expect compile-fail
 * @section 17.8
 * @design break 只能在循环（while/do-while/for/for-of/for-in）或 switch 中使用，在循环和 switch 外使用应产生编译错误
 * @note 反向用例：验证 break 在循环外使用产生编译时错误
 */
function testBreakOutsideLoop(): void {
  let x: number = 10
  if (x > 5) {
    break
  }
}
