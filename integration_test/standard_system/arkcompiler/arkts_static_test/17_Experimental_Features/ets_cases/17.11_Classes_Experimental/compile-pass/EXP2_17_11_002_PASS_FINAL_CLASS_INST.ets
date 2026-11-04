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
 * @id EXP2_17_11_002_PASS_FINAL_CLASS_INST
 * @expect compile-pass
 * @section 17.11
 * @design 验证 final 类实例化编译通过
 * @note 正向用例：final 类可以被正常实例?
 */
final class FinalPoint { public x: int = 0
  y: int = 0
}

function main(): void {
  let p: FinalPoint = new FinalPoint()
  p.x = 10
  console.log(p.x.toString())}

