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
 * @id EXP_07_05_01_017_PASS_CLASS_ARRAY_CONTEXT
 * @expect compile-pass
 * @section 7.5.1
 * @design 类类型数组上下文：aClass[] 使用类实例初始化
 * @note 正向用例：验证类类型作为数组元素时推断编译通过
 */
class AClass {}

let b1: AClass[] = [new AClass(), new AClass()]
