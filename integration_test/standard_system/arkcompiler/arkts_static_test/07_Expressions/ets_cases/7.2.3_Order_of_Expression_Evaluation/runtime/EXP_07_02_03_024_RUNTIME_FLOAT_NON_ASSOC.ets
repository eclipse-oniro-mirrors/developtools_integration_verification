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
 * @id EXP_07_02_03_024_RUNTIME_FLOAT_NON_ASSOC
 * @expect runtime
 * @section 7.2.3
 * @design 验证浮点数非结合性：浮点加法不满足结合律，(a+b)+c != a+(b+c)
 * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  // Large float + small float + negative: demonstrates non-associativity
  let a: double = 1.0e20;
  let b: double = -1.0e20;
  let c: double = 1.0;

  // (a + b) + c = (1e20 + (-1e20)) + 1 = 0 + 1 = 1.0
  let left: double = (a + b) + c;

  // a + (b + c) = 1e20 + (-1e20 + 1) ≠ 1.0 due to floating point precision
  let right: double = a + (b + c);

  // Due to floating-point non-associativity, these might differ
  // (a+b)+c = 1.0, but a+(b+c) may lose precision in the intermediate step
  let differ: boolean = left != right;

  // Integer is always associative
  let ix: int = 1000000;
  let iy: int = -1000000;
  let iz: int = 5;
  let intLeft: int = (ix + iy) + iz;
  let intRight: int = ix + (iy + iz);
  let intMatch: boolean = intLeft == intRight;

  console.log('' + left + right + differ + intMatch);
}
