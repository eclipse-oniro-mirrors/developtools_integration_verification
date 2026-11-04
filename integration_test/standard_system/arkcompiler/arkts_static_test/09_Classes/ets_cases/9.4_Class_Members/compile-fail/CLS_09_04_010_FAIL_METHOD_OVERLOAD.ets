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
 * @id CLS_09_04_010_FAIL_METHOD_OVERLOAD
 * @expect compile-fail
 * @section 9.4
 * @design TS风格方法重载（无body签名）ArkTS不支持
 * @note 2026-07-17 PDF原文核查：ArkTS方法重载需用§17.9实验特性`overload`关键字，
 *       不支持TS风格的多签名语法。编译器报ESE0017是正确行为。
 *       从compile-pass移至compile-fail。
 */
class Overload010 {
  foo(x: number): number
  foo(x: string): string
  foo(x: number | string): number | string {
    if (typeof x === 'number') {
      return x * 2
    }
    return x + '!'
  }
}
