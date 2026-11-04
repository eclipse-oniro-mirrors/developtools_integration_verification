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
 * @id EXP_07_35_03_006_PASS_VOID_RETURN_TYPE
 * @expect compile-pass
 * @section 7.35.3
 * @design 验证 void 返回类型 Lambda 表达式的类型 — void 是有效函数类型返回类型
 * @note 正向用例：void 返回类型 lambda 编译通过
 */
function logMsg(msg: string): void {
  console.log(msg)
}

function main(): void {
  // void 返回类型，空块体
  const f1: () => void = (): void => {}
  f1()

  // void 返回类型，void 调用表达式体
  const f2: (msg: string) => void = (msg: string): void => logMsg(msg)
  f2('test')

  // void 返回类型，显式空块
  const f3: () => void = (): void => {
    // empty block
  }
  f3()

  // void lambda 赋值给 void 函数类型
  const f4: () => void = (): void => {}
  let f5: () => void = f4
  f5()

  console.log('done')
}
