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
/*
 * @id SEM_15_14_00_216_RUNTIME_compatibility
 * @expect runtime
 * @section 15.14
 * @design 兼容特性综合验证：字符串数字混合 `||` 链。
 */

function main(): void {
  let a = '' || 'default'
  arktest.assertEQ(a, 'default')

  let b = 0 || 42
  arktest.assertEQ(b, 42)

  let c = 'ok' && 99
  arktest.assertEQ(c, 99)

  let d = null || 'fallback'
  arktest.assertEQ(d, 'fallback')
}
