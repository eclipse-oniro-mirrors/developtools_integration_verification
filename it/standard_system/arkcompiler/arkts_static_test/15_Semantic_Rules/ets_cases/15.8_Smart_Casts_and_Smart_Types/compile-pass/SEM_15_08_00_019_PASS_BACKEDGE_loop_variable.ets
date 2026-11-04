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
 * @id SEM_15_08_00_019_PASS_BACKEDGE_loop_variable
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8.4：反向边节点（循环）更新时，循环变量重置为声明类型
 * @note 测试循环变量在循环后的类型重置
 */

// 测试循环变量在循环后的类型重置
function testBackedgeLoopVariable(): void {
  let x: number | string = 42
  
  // 循环前：x 的智能类型是 number | string
  if (typeof x === 'number') {
    console.log('Before loop: ' + (x * 2))
  }
  
  // while 循环
  while (typeof x === 'number') {
    // 循环内：x 的智能类型是 number
    console.log('In loop: ' + (x * 2))
    break  // 简化示例
  }
    
  // 循环后：x 的智能类型重置为声明类型 number | string
  if (typeof x === 'string') {
    console.log('After loop (string): ' + x.toUpperCase())
  } else if (typeof x === 'number') {
    console.log('After loop (number): ' + (x * 2))
  }
  
  // for 循环
  for (let i = 0; i < 10; i++) {
    // 循环内：i 的智能类型是 number
    console.log('For loop: ' + i)
}
console.log('Backedge loop variable test passed')
}
