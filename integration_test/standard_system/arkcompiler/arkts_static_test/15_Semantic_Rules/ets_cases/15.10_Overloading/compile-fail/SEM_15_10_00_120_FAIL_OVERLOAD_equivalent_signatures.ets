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
 * @id SEM_15_10_00_120_FAIL_OVERLOAD_equivalent_signatures
 * @expect compile-fail
 * @section 15.10
 * @design 规范 15.10.4：如果两个隐式重载函数的签名是重载等价的，则发生编译时错误
 * @note 测试重载等价签名（应该编译失败）
 */

// 测试重载等价签名（编译失败）
// 注意：ArkTS 可能不支持泛型擦除后的签名比较，所以这个测试可能需要调整

function foo(x: string[]): string {
  return x[0]
}

// 编译失败：重载等价签名（string[] 和 number[] 擦除后都是 Array）
function foo(x: number[]): number {
  return x[0]
}

function testOverloadEquivalentSignatures(): void {
  // 这个代码不应该编译成功
  console.log('This should not compile')
}
