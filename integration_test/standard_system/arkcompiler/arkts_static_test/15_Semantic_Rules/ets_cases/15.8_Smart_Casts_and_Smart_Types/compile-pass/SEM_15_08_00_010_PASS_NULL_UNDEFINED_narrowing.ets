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
 * @id SEM_15_08_00_010_PASS_NULL_UNDEFINED_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：null/undefined 的类型收窄（智能类型转换）
 * @note 测试 null/undefined 检查后的智能类型转换
 */

// 测试 null/undefined 收窄
function testNullUndefinedNarrowing(value: string | null | undefined): void {
  // null/undefined 检查前的类型
  let v: string | null | undefined = value
  
  // null/undefined 检查后的智能类型转换
  if (v != null && v != undefined) {
    // 在这个分支中，v 的智能类型是 string
    let len: number = v.length  // OK: string 有 length 属性
    console.log('String length: ' + len)
} else if (v === null) {
    // 在这个分支中，v 的智能类型是 null
    console.log('Value is null')
} else {
    // 在这个分支中，v 的智能类型是 undefined
    console.log('Value is undefined')
}
  
  // 使用可选链和空值合并
  let length: number = v?.length ?? 0
  console.log('Length with optional chaining: ' + length)
}
