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
 * @id EXP2_17_16_011_FAIL_TYPE_PREDICATE
 * @expect compile-fail
 * @section 17.16
 * @design 类型谓词函数签名中的 is——ArkTS 不支持类型谓词
 * @note 反向用例：验证类型谓词 is 触发编译错误 ESY169587。
 *       ArkTS 不支持 TypeScript 的 "x is Type" 返回类型谓词。
 */
function testTypePredicate(): void {
  console.log('type predicate test')
}

function isString(val: Object): val is string {
  return true
}
