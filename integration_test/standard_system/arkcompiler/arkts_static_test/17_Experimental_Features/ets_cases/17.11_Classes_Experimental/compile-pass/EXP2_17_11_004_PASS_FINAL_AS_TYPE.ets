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
 * @id EXP2_17_11_004_PASS_FINAL_AS_TYPE
 * @expect compile-pass
 * @section 17.11
 * @design 验证 final 类作为类型注解编译通过
 * @note 正向用例：final 类可作为变量类型、参数类型使?
 */
final class Token { public id: int = 0
}

function useToken(t: Token): void {
  console.log(t.id.toString())
}

function main(): void {
  let tok: Token = new Token()
  tok.id = 1
  useToken(tok)}

