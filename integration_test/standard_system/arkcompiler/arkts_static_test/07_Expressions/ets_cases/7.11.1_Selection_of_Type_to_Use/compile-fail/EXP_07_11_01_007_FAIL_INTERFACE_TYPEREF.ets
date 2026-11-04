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
 * @id EXP_07_11_01_007_FAIL_INTERFACE_TYPEREF
 * @expect compile-fail
 * @section 7.11.1
 * @design typeReference 形式使用接口名：typeReference 必须指向类，接口应报编译时错误
 * @note 反向用例：验证接口名作为 typeReference 调用方法时编译错误
 */
interface Drawable {
    draw(): void
}
let v: string = Drawable.toString()
