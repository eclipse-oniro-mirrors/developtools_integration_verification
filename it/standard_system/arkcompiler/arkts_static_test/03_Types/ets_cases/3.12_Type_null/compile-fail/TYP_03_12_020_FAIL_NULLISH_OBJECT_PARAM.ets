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
 * @id TYP_03_12_020_FAIL_NULLISH_OBJECT_PARAM
 * @expect compile-fail
 * @section 3.12
 * @design null | undefined 联合类型值赋给 Object 参数
 * @note 反向用例：验证 spec 规定 nullish 类型不兼容 Object
 */
function acceptObject(o: Object): void {}
function testNullishObjectParam(): void {
  let x: null | undefined = null
  acceptObject(x)
}