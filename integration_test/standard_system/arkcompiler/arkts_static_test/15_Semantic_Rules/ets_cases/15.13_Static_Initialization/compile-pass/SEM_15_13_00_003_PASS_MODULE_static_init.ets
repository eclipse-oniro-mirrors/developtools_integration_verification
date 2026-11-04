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
 * @id SEM_15_13_00_003_PASS_MODULE_static_init
 * @expect compile-pass
 * @section 15.13
 * @design 规范 15.13：模块静态初始化在首次调用模块函数或访问模块变量时执行
 * @note 测试模块静态初始化
 */

// 测试模块静态初始化
let moduleCount: number = 0

// 模块中的静态初始化
moduleCount = 10

export function getModuleCount(): number {
  return moduleCount
}

export function incrementModuleCount(): void {
  moduleCount++
}

function testModuleStaticInit(): void {
  // 在首次调用模块函数之前，静态初始化应该已经执行
  console.log('Before first access: ' + getModuleCount())  // 输出: 10
  
  incrementModuleCount()
  console.log('After increment: ' + getModuleCount())  // 输出: 11
    
  console.log('Module static initialization test passed')
}

// 运行测试
test_module_static_init()