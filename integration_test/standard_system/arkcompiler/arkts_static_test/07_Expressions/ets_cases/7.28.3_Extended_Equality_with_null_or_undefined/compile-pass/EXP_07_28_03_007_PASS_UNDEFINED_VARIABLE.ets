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
 * @id EXP_07_28_03_007_PASS_UNDEFINED_VARIABLE
 * @expect compile-pass
 * @section 7.28.3
 * @design 验证将 undefined 赋值给可空变量后进行比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let b: Object | undefined = undefined;
  let r1: boolean = b == undefined;
  let r2: boolean = b === undefined;
  let r3: boolean = b == null;
  let r4: boolean = b === null;
}
