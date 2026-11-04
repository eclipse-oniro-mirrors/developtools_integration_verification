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
/*
 * @id SEM_15_11_00_007_PASS_OVERLOAD_warning
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11.7：如果重载集中的某个重载实体永远不会被调用，则发出编译时警告
 * @note 测试重载集警告：模糊调用
 */

// 测试重载集警告：模糊调用
function f1(p: number): void {
  console.log('f1: number')
}

function f2(p: number | string): void {
  console.log('f2: number|string')
}

function f3(p: string): void {
  console.log('f3: string')
}

// 显式重载声明
overload foo { f1, f2, f3 }

function testOverloadWarning(): void {
  // f3 永远不会被调用，因为 f2 可以接受 string
  foo(5)  // 调用 f1()
  foo('5')  // 调用 f2()，因为 f2 在 f3 之前
  
  console.log('Overload warning test passed (check warnings)')
}
