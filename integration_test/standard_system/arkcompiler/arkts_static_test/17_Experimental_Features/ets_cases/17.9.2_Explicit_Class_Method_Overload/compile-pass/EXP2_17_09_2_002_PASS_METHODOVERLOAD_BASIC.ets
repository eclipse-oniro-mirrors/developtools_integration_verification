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
 * @id EXP2_17_09_2_002_PASS_METHODOVERLOAD_BASIC
 * @expect compile-pass
 * @section 17.9.2
 * @design 类方法 overload 基本声明和调用
 * @note 正向用例：类中 overload 不同参数类型的方法
 */
class Printer {
  print(a: int): string { return 'int:' + a }
  printStr(a: string): string { return 'str:' + a }
  printBool(a: boolean): string { return 'bool:' + a }
  overload print { print, printStr, printBool }
}
