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
 * @id TYP_03_03_007_PASS_INPLACE_FUNCTION
 * @expect compile-pass
 * @section 3.3
 * @design 就地函数类型声明 (x: T) => R
 * @note 正向用例：验证就地函数类型声明
 */
function testInplaceFunction(): void {
  let f1: () => int = (): int => { return 42 }
  let f2: (x: int) => int = (x: int): int => { return x + 1 }
  let f3: (a: int, b: string) => boolean = (a: int, b: string): boolean => { return a > 0 }
  let f4: () => void = (): void => {}
}