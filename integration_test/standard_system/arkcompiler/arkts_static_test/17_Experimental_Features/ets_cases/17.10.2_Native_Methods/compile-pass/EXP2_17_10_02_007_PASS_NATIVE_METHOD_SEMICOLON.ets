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
 * @id EXP2_17_10_02_007_PASS_NATIVE_METHOD_SEMICOLON
 * @expect compile-pass
 * @section 17.10.2
 * @design 原生方法使用分号作为方法体：验证 native method 可以用分号终结（与无分号同样有效）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class SemicolonNative {
  native foo(): void;
  native bar(): int;
  native baz(s: string): string;
}
