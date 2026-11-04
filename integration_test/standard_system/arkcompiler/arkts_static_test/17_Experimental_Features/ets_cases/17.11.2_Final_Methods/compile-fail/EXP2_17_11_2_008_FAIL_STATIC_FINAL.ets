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
 * @id EXP2_17_11_2_008_FAIL_STATIC_FINAL
 * @expect compile-fail
 * @section 17.11.2
 * @design static + final 组合：验证 static 和 final 不能同时修饰一个方法
 * @note 反向用例：验证 static final 组合产生 ESE0048/ESE0077 编译错误
 */
class Foo {
  static final bar(): void {
    console.log('bar')
  }
}
