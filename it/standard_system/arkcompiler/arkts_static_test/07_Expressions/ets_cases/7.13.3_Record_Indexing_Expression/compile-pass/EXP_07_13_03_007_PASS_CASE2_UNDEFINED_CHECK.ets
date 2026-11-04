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
 * @id EXP_07_13_03_007_PASS_CASE2_UNDEFINED_CHECK
 * @expect compile-pass
 * @section 7.13.3
 * @design Case 2: 验证索引结果为 Value | undefined，可进行 undefined 检查和 nullish 合并
 * @note 正向用例：x[3] 类型为 string | undefined，undefined 检查后可使用 s! 断言
 */
function main(): void {
  let x: Record<number, string> = {
    1: 'hello',
    2: 'bye'
  };
  let n: number = 3;
  let s: string | undefined = x[n];
  let r: string = 'no';
  if (s != undefined) {
    r = s as string;
  }
}
