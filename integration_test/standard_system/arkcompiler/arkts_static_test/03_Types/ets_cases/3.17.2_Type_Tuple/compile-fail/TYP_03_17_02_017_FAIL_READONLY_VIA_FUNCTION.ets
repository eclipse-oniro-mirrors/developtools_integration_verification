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
 * @id TYP_03_17_02_017_FAIL_READONLY_VIA_FUNCTION
 * @expect compile-fail
 * @section 3.17.2
 * @design 验证 readonly tuple 通过函数/方法修改元素编译错误（spec/types.md:1212-1214）
 * @note 反向用例：readonly tuple 元素不可通过函数或方法修改
 */
function modify(x: readonly [number, string]): void {
  x[0] = 42
}