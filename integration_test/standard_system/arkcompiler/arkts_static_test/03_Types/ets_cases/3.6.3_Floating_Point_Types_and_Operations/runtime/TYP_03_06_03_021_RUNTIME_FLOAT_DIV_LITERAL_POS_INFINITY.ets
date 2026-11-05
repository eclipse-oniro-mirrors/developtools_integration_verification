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
 * @id TYP_03_06_03_021_RUNTIME_FLOAT_DIV_LITERAL_POS_INFINITY
 * @expect runtime
 * @section 3.6.3
 * @design 5.0/0.0 字面量 → +Infinity（spec §15.17.2 浮点除零永不抛错）
 * @note 运行时用例：与整数除零不同，浮点字面量除 0 编译通过
 *       对比：Java/Swift 同样行为，三语言完全一致
 */
function main(): void {
  let c: double = 5.0 / 0.0
  let posInf: double = 1.0 / 0.0
  if (c != posInf) {
    throw new Error("5.0/0.0 should be +Infinity, got " + c)
  }
  console.log("5.0/0.0 = Infinity verified")
}