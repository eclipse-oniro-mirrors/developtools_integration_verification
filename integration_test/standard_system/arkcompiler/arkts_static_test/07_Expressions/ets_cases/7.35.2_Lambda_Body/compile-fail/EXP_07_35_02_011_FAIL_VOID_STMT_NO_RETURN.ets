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
 * @id EXP_07_35_02_011_FAIL_VOID_STMT_NO_RETURN
 * @expect compile-fail
 * @section 7.35.2
 * @design 验证 Lambda 返回类型非 void/non-never 时，块体仅有 void 语句没有 return 则产生编译时错误
 * @note 反向用例：非 void 返回类型（int）的 lambda 块体中只有 void 调用语句，本质上是块体无 return，应产生编译时错误
 */
function helper(): void {}

function main(): void {
  const f: () => int = (): int => {
    helper()
  }
  let r: int = f()
  console.log('' + r)
}
