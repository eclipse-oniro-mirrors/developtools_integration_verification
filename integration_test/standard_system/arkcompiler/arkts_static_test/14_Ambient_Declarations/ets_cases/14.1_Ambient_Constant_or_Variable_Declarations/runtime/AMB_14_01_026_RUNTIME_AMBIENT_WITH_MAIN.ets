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
 * @id AMB_14_01_026_RUNTIME_AMBIENT_WITH_MAIN
 * @expect runtime
 * @section 14.1
 * @design 多个 ambient 声明（let/const/多声明）与正常代码共存于同一文件中，
 *          验证多声明组合不干扰编译和执行
 * @note 运行时用例：验证多个 ambient 声明共存不影响正常代码编译运行
 */
declare let v1: int
declare const c1: string
declare let v2: boolean
declare let v3: double

function main(): void {
  let x: int = 1
  let y: int = 2
  let sum: int = x + y
  if (sum != 3) {
    throw new Error('assertion failed: ' + sum)
  }
  console.log('verified')
}
