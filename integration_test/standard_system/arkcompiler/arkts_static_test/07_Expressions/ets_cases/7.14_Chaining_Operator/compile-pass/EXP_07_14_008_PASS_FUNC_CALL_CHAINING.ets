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
 * @id EXP_07_14_008_PASS_FUNC_CALL_CHAINING
 * @expect compile-pass
 * @section 7.14
 * @design 验证可空函数类型变量上的链式调用：nullableFunc?.() 编译通过
 * @note 正向用例：函数类型变量为 T|undefined 时使用 ?.() 调用，编译通过
 */
function main(): void {
  let fn: (() => string) | undefined = (): string => {
    return 'hello';
  };
  let s: string | undefined = fn?.();
}
