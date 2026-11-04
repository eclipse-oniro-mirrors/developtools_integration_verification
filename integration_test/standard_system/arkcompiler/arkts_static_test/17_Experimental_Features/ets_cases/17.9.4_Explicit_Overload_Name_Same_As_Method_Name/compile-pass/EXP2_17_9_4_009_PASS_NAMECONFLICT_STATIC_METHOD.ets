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
 * @id EXP2_17_9_4_009_PASS_NAMECONFLICT_STATIC_METHOD
 * @expect compile-pass
 * @section 17.9.4
 * @design 验证 overload 名可以与类中其他方法共存（非冲突场景?
 * @note 正向用例：overload 集合在类中与其他方法共存，只要方法不?overload 列表中就不会冲突
 */
class Service {
  log(x: int): string { return 'int-log:' + x.toString() }
  logStr(x: string): string { return 'str-log:' + x }
  overload log { log, logStr }
  // 额外方法：不?overload 集中，独立调?
  extra(): string { return 'extra' }
}

function main(): void {
  let s: Service = new Service()
  let r1: string = s.log(42)
  let r2: string = s.extra()
  console.log(r1 + r2)
}

