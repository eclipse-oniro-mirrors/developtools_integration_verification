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
 * @id EXP_07_14_005_PASS_MIX_NULLISH_NON_NULLISH
 * @expect compile-pass
 * @section 7.14
 * @design 验证 nullish 和非 nullish 混合使用链式操作符：s1 非 nullish 类型不变，s2 nullish 类型为 T|undefined
 * @note 正向用例：同时测试 s1?.[0] 非 nullish → string，s2?.[0] nullish → string|undefined
 */
function main(): void {
  let s1: string = 'hello';
  let s2: string | undefined = 'world';
  let a: string = s1?.[0];
  let b: string | undefined = s2?.[0];
}
