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
 * @id SEM_15_13_00_001_PASS_CLASS_static_init
 * @expect compile-pass
 * @section 15.13
 * @design 规范 15.13：类静态初始化在首次访问类静态成员或创建类实例时执行
 * @note 测试类静态初始化
 */

// 测试类静态初始化
class Counter {
  public static count: number = 0
  
  // 静态初始化块
  static {
    console.log('Static initialization block')
    Counter.count = 10
  }
  
  static increment(): void {
    Counter.count++
  }
}

function testClassStaticInit(): void {
  // 在首次访问静态方法之前，静态初始化块应该已经执行
  console.log('Before first access: ' + Counter.count)  // 输出: 10
    
  Counter.increment()
  console.log('After increment: ' + Counter.count)  // 输出: 11
    
  // 创建实例也会触发静态初始化（如果还没有执行）
  let counter: Counter = new Counter()
    
  console.log('Class static initialization test passed')
}

// 运行测试
test_class_static_init()