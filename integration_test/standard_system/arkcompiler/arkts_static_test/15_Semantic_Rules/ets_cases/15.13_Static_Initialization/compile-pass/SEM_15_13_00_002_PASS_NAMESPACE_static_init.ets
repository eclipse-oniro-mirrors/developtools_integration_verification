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
 * @id SEM_15_13_00_002_PASS_NAMESPACE_static_init
 * @expect compile-pass
 * @section 15.13
 * @design 规范 15.13：命名空间静态初始化在首次访问命名空间成员时执行
 * @note 测试命名空间静态初始化
 */

// 测试命名空间静态初始化
namespace MyNamespace {
  export let count: number = 0
  
  // 命名空间中的静态初始化
  count = 10
  
  export function increment(): void {
    count++
  
}
console.log('Namespace static initialization')
}

function testNamespaceStaticInit(): void {
  // 在首次访问命名空间成员之前，静态初始化应该已经执行
  console.log('Before first access: ' + MyNamespace.count)  // 输出: 10
    
  MyNamespace.increment()
  console.log('After increment: ' + MyNamespace.count)  // 输出: 11
    
  console.log('Namespace static initialization test passed')
}

// 运行测试
test_namespace_static_init()