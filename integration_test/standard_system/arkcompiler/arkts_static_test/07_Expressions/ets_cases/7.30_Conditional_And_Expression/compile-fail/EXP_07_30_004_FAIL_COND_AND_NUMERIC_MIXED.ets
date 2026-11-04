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
 * @id EXP_07_30_004_FAIL_COND_AND_NUMERIC_MIXED
 * @expect compile-fail
 * @section 7.30
 * @design 验证 && 操作数与 int/float/long 等数值类型混合时应产生编译时错误，覆盖 3 种混合场景：
 *         boolean && numeric、numeric && boolean、numeric && numeric
 * @note 反向用例：boolean && int/float/long 混合类型应产生编译期错误
 */
function main(): void {
  let b: boolean = true;
  let i: int = 1;
  let f: float = 1.0;
  let l: long = 1;

  // boolean && numeric — 应报错
  let r1: boolean = b && i;
  let r2: boolean = b && f;
  let r3: boolean = b && l;

  // numeric && boolean (反向) — 应报错
  let r4: boolean = i && b;
  let r5: boolean = f && b;
  let r6: boolean = l && b;

  // numeric && numeric (全非 boolean) — 应报错
  let r7: boolean = i && i;
  let r8: boolean = f && f;
  let r9: boolean = l && l;
  let r10: boolean = i && f;
  let r11: boolean = f && l;
}
