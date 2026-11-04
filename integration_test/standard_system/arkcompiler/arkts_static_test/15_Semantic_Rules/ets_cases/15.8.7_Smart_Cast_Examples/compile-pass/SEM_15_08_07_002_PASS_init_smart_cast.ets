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
 * @id SEM_15_08_07_002_PASS_init_smart_cast
 * @expect compile-pass
 * @section 15.8.7
 * @design 规范 15.8.7：初始化器缩窄number|string为number后自增
 * @note 正向用例：let a: number|string=42后a++安全
 */
function boo(): void {
    let a: number | string = 42;
    a++;
}
function main(): void {
    boo();
}
