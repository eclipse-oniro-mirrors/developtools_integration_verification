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
 * @id LEX_02_05_039_PASS_NULLISH_COALESCING
 * @expect compile-pass
 * @section 2.5
 * @design 空值合并运算符 ??
 * @note compile-pass 用例：验证空值合并运算符
 */

// 空值合并运算符 ??
let x: int | null = null
let y: int = x ?? 42

let a: string | undefined = undefined
let b: string = a ?? "default"
