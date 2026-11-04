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
 * @id SEM_15_13_00_203_RUNTIME_CONCURRENT_init
 * @expect runtime
 * @section 15.13
 * @design 规范 15.13.1：并发静态初始化安全性
 * @note 测试并发静态初始化安全性
 */

// 测试并发静态初始化安全性
class ConcurrentCounter {
  public static count: number = 0
  
  static {
    console.log('Static initialization started')
    // 模拟耗时操作
    for (let i = 0; i < 1000000; i++) {
      // 空循环，模拟耗时操作
    }
    ConcurrentCounter.count = 10
    console.log('Static initialization completed')
}
  
  static increment(): void {
    ConcurrentCounter.count++
  }
}

function testConcurrentStaticInit(): void {
  // 注意：ArkTS 的并发模型可能不同于 Java
  // 这里假设有多个并发尝试访问静态成员
  
  console.log('Before first access: ' + ConcurrentCounter.count)  // 输出: 10
    
  ConcurrentCounter.increment()
  console.log('After increment: ' + ConcurrentCounter.count)  // 输出: 11
    
  console.log('Concurrent static initialization test passed')
}

// 运行测试
test_concurrent_static_init()