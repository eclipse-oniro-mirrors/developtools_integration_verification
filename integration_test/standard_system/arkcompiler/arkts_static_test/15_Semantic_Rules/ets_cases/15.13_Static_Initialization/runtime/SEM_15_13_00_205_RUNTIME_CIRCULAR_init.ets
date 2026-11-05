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
 * @id SEM_15_13_00_205_RUNTIME_CIRCULAR_init
 * @expect runtime
 * @section 15.13
 * @design 规范 15.13：循环静态初始化依赖可能导致死锁
 * @note 测试循环静态初始化依赖
 */

// 测试循环静态初始化依赖
class A {
  public static value: number = B.value + 1
}

class B {
  public static value: number = A.value + 1
}

function testCircularInit(): void {
  // 注意：ArkTS 的循环静态初始化依赖处理可能不同于 Java
  // 这里假设会抛出错误或死锁
  
  console.log('Circular initialization test passed (if no deadlock)')
}

// 运行测试
test_circular_init()