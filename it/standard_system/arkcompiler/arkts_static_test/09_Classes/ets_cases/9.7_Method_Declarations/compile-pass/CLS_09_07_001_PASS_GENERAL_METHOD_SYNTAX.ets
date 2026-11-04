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
 * @id CLS_09_07_001_PASS_GENERAL_METHOD_SYNTAX
 * @expect compile-pass
 * @section 9.7
 * @design 基本方法声明语法 — classMethodDeclaration: methodModifier* identifier signature block?
 * @note 正向用例：无修饰符、带返回类型、void返回、多参数方法
 */
class GeneralMethods {
  noReturn(): void {}
  withReturn(): int { return 42 }
  multiParam(a: int, b: string, c: boolean): string { return b }
  noParams(): int { return 0 }
}
