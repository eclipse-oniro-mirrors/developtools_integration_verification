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
 * @id AMB_14_01_025_RUNTIME_AMBIENT_CONTEXT
 * @expect runtime
 * @section 14.1
 * @design ambient declare let 和 declare const 声明在带 main 入口的文件中，
 *          验证它们不干扰正常代码的编译与执行。
 *          注意：ambient 声明不产生可执行代码，此处仅验证文件可正常编译运行。
 * @note 运行时用例：验证 ambient 声明在文件上下文中不影响其他代码运行
 */
declare let externalVar: int
declare const externalConst: string

function main(): void {
  let result: int = 42
  if (result != 42) {
    throw new Error('assertion failed')
  }
  console.log('verified')
}
