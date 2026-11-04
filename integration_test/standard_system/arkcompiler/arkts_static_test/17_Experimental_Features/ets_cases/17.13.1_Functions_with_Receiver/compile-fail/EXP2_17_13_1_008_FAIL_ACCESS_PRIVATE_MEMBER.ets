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
 * @id EXP2_17_13_1_008_FAIL_ACCESS_PRIVATE_MEMBER
 * @expect compile-fail
 * @section 17.13.1
 * @design 接收者函数只能访问公有成员，访问私有成员应编译失败
 * @note 反向用例：验证该场景应产生编译时错误 ESE0293
 */
class SecretHolder { private secret: string = 'classified'; public label: string = 'public' }
function revealSecret(this: SecretHolder): string { return this.secret }
function testAccessPrivate(): void {
  let sh: SecretHolder = new SecretHolder()
  let result: string = sh.revealSecret()
}
