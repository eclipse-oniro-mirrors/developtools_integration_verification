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
 * @id SEM_15_11_00_030_PASS_overload_resolution
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11：重载解析按参数类型选择最佳匹配
 * @note 测试重载解析：根据参数类型选择正确的重载函数
 */

// 测试重载解析
function fmt(x: int): string {
  return 'int:' + x.toString()
}

function fmt(x: string): string {
  return 'str:' + x
}

function testOverloadResolution(): void {
  let r: string = fmt(42)  // 调用 fmt(x: int)

  console.log(r)
}
