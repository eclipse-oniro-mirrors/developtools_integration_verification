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
 * @id EXP_07_02_02_017_FAIL_NEGATIVE_ARRAY_INDEX
 * @expect compile-fail
 * @section 7.2.2
 * @design 验证字面量负数组索引编译时报错：spec 规定运行时抛 RangeError，但编译器额外静态检测字面量负索引
 * @note 反向用例：spec 要求运行时 RangeError，实现额外在编译时报错
 *       ⚠️ SPEC 不一致：spec 要求 RangeError 运行时抛出，实现提前在编译时报错
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
  let arr: Fixedint[] = [1, 2, 3];
  let neg: int = arr[-1];
  console.log('' + neg);
}
