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
 * @id EXP_07_10_01_001_PASS_STATIC_FIELD_ACCESS
 * @expect compile-pass
 * @section 7.10.1
 * @design 通过类名访问非 readonly 静态字段：ClassName.staticField 语法
 * @note 正向用例：验证静态字段访问时 objectReference 采用 typeReference 形式
 */
class Counter {
    public static count: int = 0
    public static step: int = 1
}
let c: int = Counter.count
let s: int = Counter.step
