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
 * @id ITF_10_04_01_006_PASS_FIELD_ACCESSOR_EQUIVALENCE
 * @expect compile-pass
 * @section 10.4.1
 * @design 必需属性的字段形式和访问器形式的等价性
 * @note 正向用例：验证字段形式声明的接口可以被访问器形式实现的类实现
 */
interface StyleField {
    color: string;
}

interface StyleAccessor {
    get color(): string;
    set color(s: string);
}

class StyleImpl1 implements StyleField {
    get color(): string {
        return "red";
    }
    set color(s: string) {}
}

class StyleImpl2 implements StyleAccessor {
    color: string = "blue";
}
