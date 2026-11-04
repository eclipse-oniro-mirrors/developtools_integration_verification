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
 * @id GEN_05_02_03_002_PASS_IMPLICIT_MULTI_INFER
 * @expect compile-pass
 * @section 5.2.3
 * @design 隐式实例化-多参数推断
 * @note 正向用例：验证多类型参数隐式推断
 */
function process<P, R>(arg: P, cb?: (p: P) => R): P | R {
    return cb != undefined ? cb(arg) : arg;
}
let r: string | number = process('hello', (s: string): number => s.length);
