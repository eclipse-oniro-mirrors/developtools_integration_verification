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
 * @id EXP_07_35_02_010_FAIL_MISSING_RETURN_BLOCK
 * @expect compile-fail
 * @section 7.35.2
 * @design 验证 Lambda 返回类型既不是 void 也不是 never 时，若块体没有 return 语句且不是单表达式体则产生编译时错误
 * @note 反向用例：非 void 返回类型的 lambda 使用空块体（没有 return），应产生编译时错误
 */
function main(): void {
  const f: () => int = (): int => {
  }
  let r: int = f()
  console.log('' + r)
}
