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
 * @id NAM_04_03_104_FAIL_TYPE_PARAM_IN_STATIC
 * @expect compile-fail
 * @section 4.3
 * @design 类型参数不能用于静态成员声明
 * @note 反向用例：验证静态成员引用类型参数 T 编译错误
 *       规范 4.3 — 类型参数作用域不包括静态成员
 */
class Container<T> {
    static default: T | undefined = undefined;
}
