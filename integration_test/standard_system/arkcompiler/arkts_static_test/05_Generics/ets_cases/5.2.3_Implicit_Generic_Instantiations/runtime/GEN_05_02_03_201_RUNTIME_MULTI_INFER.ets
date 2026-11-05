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
 * @id GEN_05_02_03_201_RUNTIME_MULTI_INFER
 * @expect runtime
 * @section 5.2.3
 * @design 多参数隐式推断运行时行为验证
 * @note spec: process(123, (x) => "ok") -> P=int, R=string, returns "ok"
 */
function process212<P, R>(arg: P, cb?: (p: P) => R): P | R {
  return cb != undefined ? cb(arg) : arg
}
function main(): void {
  let r212: string = process212(123, (x) => "ok") as string
  if (r212 != 'ok') {
    throw new Error('multi infer failed')
  console.log('multi param inference runtime verified')
}
