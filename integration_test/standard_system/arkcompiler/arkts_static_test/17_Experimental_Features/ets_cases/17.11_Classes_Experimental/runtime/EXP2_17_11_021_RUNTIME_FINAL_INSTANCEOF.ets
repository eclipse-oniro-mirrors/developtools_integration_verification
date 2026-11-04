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
 * @id EXP2_17_11_021_RUNTIME_FINAL_INSTANCEOF
 * @expect runtime
 * @section 17.11
 * @design 运行时验证 final 类 instanceof 检查
 * @note 运行时用例：final 类实例的 instanceof 检查行为
 */
final class FinalA { public tag: string = 'final-A'
}

function main(): void {
  let a: FinalA = new FinalA()
  let isFinal: boolean = a instanceof FinalA
  console.log(isFinal.toString())}
