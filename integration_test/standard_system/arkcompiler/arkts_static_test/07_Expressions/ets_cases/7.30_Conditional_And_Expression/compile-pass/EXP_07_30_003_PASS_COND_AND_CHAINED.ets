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
 * @id EXP_07_30_003_PASS_COND_AND_CHAINED
 * @expect compile-pass
 * @section 7.30
 * @design 验证 && 的链式运算、左结合性和完全结合律：((a) && (b)) && (c) 与 (a) && ((b) && (c)) 结果相同
 * @note 正向用例：验证 && 链式运算和结合律编译通过
 */
function main(): void {
  let T: boolean = true;
  let F: boolean = false;

  // 链式：true && true && true == true
  let ch1: boolean = T && T && T;

  // 链式含 false：true && false && true == false
  let ch2: boolean = T && F && T;

  // 左结合性：(true && false) && true
  let left: boolean = (T && F) && T;

  // 右结合性：true && (false && true)
  let right: boolean = T && (F && T);

  // 完全结合律：((a) && (b)) && (c) 与 (a) && ((b) && (c)) 在 boolean 结果上等价
  let assoc1: boolean = (T && T) && F;
  let assoc2: boolean = T && (T && F);

  // 混合变量
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;

  let mix1: boolean = a && b;
  let mix2: boolean = a && c;
  let mix3: boolean = b && c;
  let mix4: boolean = a && b && c;
  let mix5: boolean = a && (b && c);
  let mix6: boolean = (a && b) && c;

  // 连续 && 链（长链）
  let longChain: boolean = T && T && T && T && F && T;
}
