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
 * @id EXP_07_35_01_003_PASS_LAMBDA_REST_PARAM
 * @expect compile-pass
 * @section 7.35.1
 * @design Lambda 剩余参数
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testLambdaRestParam(): void {
  let f: (...args: int[]) => void = (...args: int[]): void => {
    console.log(args[0].toString())
  }
  f(1, 2, 3)
}
