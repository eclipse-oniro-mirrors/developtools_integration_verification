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
 * @id TYP_03_01_026_FAIL_FIXED_RESIZABLE_MIX
 * @expect compile-fail
 * @section 3.1
 * @design FixedArray 与可变数组(T[])不能互赋值应编译失败: FixedArray→T[]、T[]→FixedArray、字面量传参 FixedArray
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testFixedResizableMixFail(): void {
  let fa: FixedArray<int> = [1, 2, 3]
  let ra: int[] = fa

  let rb: int[] = [1, 2, 3]
  let fb: FixedArray<int> = rb
}

function testArrayParameterFail(): void {
  function acceptFixed(fa: FixedArray<int>): void {}
  acceptFixed([1, 2, 3])
}