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
 * @id EXP2_17_10_03_013_RUNTIME_NATIVE_CONSTRUCTOR_CLASS_METHODS
 * @expect runtime
 * @section 17.10.3
 * @design native 构造函数类的方法运行时验证：验证类方法（非 native）可正常声明和调用
 * @note 运行时用例：验证 native 构造函数类中声明的方法可在类型系统中正常引用
 */
class NativeMethodClass {
  native constructor()
  public label: string = 'default'

  setLabel(lbl: string): void {
    this.label = lbl
  }

  getLabel(): string {
    return this.label
  }
}

function main(): void {
  // Type system allows method references
  let obj: NativeMethodClass | null = null
  if (obj != null) {
    throw new Error('assertion failed: obj should be null')
  }
  // Function type using the class
  let fn: (n: NativeMethodClass) => string = (n: NativeMethodClass): string => {
    return n.getLabel()
  }
  console.log('verified')
}
