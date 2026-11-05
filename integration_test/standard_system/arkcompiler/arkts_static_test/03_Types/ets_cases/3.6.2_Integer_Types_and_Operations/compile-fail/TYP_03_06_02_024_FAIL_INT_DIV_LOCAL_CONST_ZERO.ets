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
/**
 * @id TYP_03_06_02_024_FAIL_INT_DIV_LOCAL_CONST_ZERO
 * @expect compile-fail
 * @section 3.6.2
 * @design 函数内 const 0 作除数应编译失败（ArkTS 做了局部常量传播）
 * @note 反向用例：局部 const 触发编译期除零检测
 *       关键：与模块级 const（TYP_03_06_02_028）行为不一致，已记入 issue
 */
function main(): void {
  const a: int = 0
  let c: int = 10 / a
  console.log(c)
}