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
 * @id EXP2_17_13_5_003_PASS_EXPLICIT_THIS_MULTIPLE_MEMBERS
 * @expect compile-pass
 * @section 17.13.5
 * @design 显式this同时访问多个接收者成员
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Config { public host: string = 'localhost'; public port: number = 8080; public secure: boolean = false }
function testExplicitThisMultiple(): void {
  let connectionString = (this: Config): string => {
    let protocol: string = 'http'
    if (this.secure) { protocol = 'https' }
    return protocol + '://' + this.host + ':' + this.port
  }
  let cfg: Config = new Config(); cfg.host = 'example.com'; cfg.port = 443; cfg.secure = true
  let cs: string = connectionString(cfg)
  console.log('compiled successfully')
}
