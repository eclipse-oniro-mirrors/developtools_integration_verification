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
 * @id SEM_15_14_00_023_PASS_COMPREHENSIVE_2
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：综合测试扩展条件表达式的各种情况
 * @note 综合测试扩展条件表达式的各种情况
 */

// 综合测试扩展条件表达式
function testComprehensiveExtendedConditional2(): void {
  // 测试逻辑 AND/OR 的短路行为
  let x: number = 0
  let y: number = 10
  
  // 短路 AND：如果第一个操作数为 false，则不评估第二个操作数
  if (x && y++) {
    console.log('This won't execute')
}
console.log('After AND short-circuit: ' + y)  // 输出: 10 (y 没有递增)
    
  // 短路 OR：如果第一个操作数为 true，则不评估第二个操作数
  x = 10
  y = 0
    
  // 短路 OR：如果第一个操作数为 true，则不评估第二个操作数
  if (x || y++) {
    console.log('OR short-circuit: ' + x)  // 输出: OR short-circuit: 10
  
}
console.log('After OR short-circuit: ' + y)  // 输出: 0 (y 没有递增)
    
  console.log('Comprehensive extended conditional test 2 passed')
}