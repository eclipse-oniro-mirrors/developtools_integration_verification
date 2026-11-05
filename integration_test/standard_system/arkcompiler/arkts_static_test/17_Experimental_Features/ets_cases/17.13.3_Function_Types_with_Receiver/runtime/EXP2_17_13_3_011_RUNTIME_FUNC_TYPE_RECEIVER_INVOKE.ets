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
 * @id EXP2_17_13_3_011_RUNTIME_FUNC_TYPE_RECEIVER_INVOKE
 * @expect runtime
 * @section 17.13.3
 * @design 运行时验证：函数类型变量通过普通调用语法正确执行
 * @note 运行时用例：实际执行验证函数类型带接收者的调用
 */
class Metric { public value: number = 0 }
type MetricReader = (this: Metric) => number
function main(): void {
  let reader: MetricReader = (this: Metric): number => { return this.value * 3 + 1 }
  let m: Metric = new Metric(); m.value = 10
  let r: number = reader(m)
  if (r != 31) { throw new Error('assertion failed: expected 31, got ' + r) }
  console.log('verified')
}
