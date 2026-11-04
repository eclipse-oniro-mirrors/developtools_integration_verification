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
 * @id EXP2_17_13_3_002_PASS_VARIABLE_FUNCTION_TYPE_RECEIVER
 * @expect compile-pass
 * @section 17.13.3
 * @design 变量使用带接收者函数类型：声明变量时指定带接收者的函数类型，通过普通调用使用
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Score { public points: number = 0 }
type ScoreModifier = (this: Score, bonus: number) => void
function testVariableFunctionType(): void {
  let addBonus: ScoreModifier = (this: Score, bonus: number): void => { this.points = this.points + bonus }
  let s: Score = new Score(); s.points = 50
  addBonus(s, 10)
  console.log('compiled successfully')
}
