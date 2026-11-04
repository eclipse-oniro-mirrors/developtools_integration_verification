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
 * @id EXP_07_15_008_FAIL_NEW_METHOD_NO_PARENS
 * @expect compile-fail
 * @section 7.15
 * @design 验证 new A.method() 编译时错误（缺少括号，应为 new A().method()）
 * @note 反向用例：new 后直接调用方法需加括号 ()
 */
class A {
  method(): void {}
}
new A.method()
