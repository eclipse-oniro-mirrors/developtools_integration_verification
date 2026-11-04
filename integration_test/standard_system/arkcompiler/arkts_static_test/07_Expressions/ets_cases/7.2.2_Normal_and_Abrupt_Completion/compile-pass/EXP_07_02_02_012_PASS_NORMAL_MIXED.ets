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
 * @id EXP_07_02_02_012_PASS_NORMAL_MIXED
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证混合表达式正常完成：包含数组索引、函数调用、类型转换、算术多种表达式的混合求值
 * @note 正向用例：验证该特性编译通过的正确用法
 */

function getValue(arr: Fixedint[], idx: int): int {
  return arr[idx];
}

function main(): void {
  let data: Fixedint[] = [10, 20, 30, 40, 50];
  let idx: int = 2;
  let val: int = getValue(data, idx);
  let casted: double = val.toDouble();
  let result: int = (data[0] + data[1]) * data[idx] / data[4];
  let flag: boolean = result > 0;
  let finalVal: int = flag ? result : -1;
  console.log('' + val + casted + result + finalVal);
}
