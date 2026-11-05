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
 * @id EXP_07_30_005_FAIL_COND_AND_STRING_BIGINT_MIXED
 * @expect compile-fail
 * @section 7.30
 * @design 验证 && 操作数与 string/bigint 混合时应产生编译时错误，覆盖 boolean && string、string && boolean、string && string、bigint 混合
 * @note 反向用例：boolean && string/bigint 混合类型应产生编译期错误
 */
function main(): void {
  let b: boolean = true;
  let s: string = 'hello';
  let bi: bigint = 1n;

  // boolean && string — 应报错
  let r1: boolean = b && s;

  // string && boolean (反向) — 应报错
  let r2: boolean = s && b;

  // string && string (全非 boolean) — 应报错
  let r3: boolean = s && s;

  // boolean && bigint — 应报错
  let r4: boolean = b && bi;

  // bigint && bigint (全非 boolean) — 应报错
  let r5: boolean = bi && bi;
}
