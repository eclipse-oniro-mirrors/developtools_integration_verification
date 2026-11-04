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
 * @id CON_06_01_036_RUNTIME_COMPOSITE_OBJECT
 * @expect runtime
 * @section 6.1
 * @design 复合字面量上下文（对象）运行时行为：对象字面量字段值正确初始化
 * @note 运行时用例：实际执行验证对象字面量字段赋值语义
 */
interface Rect {
  width: int
  height: int
  label: string
}

function main(): void {
  let r: Rect = {
    width: 100,
    height: 50,
    label: 'box'
  }
  if (r.width != 100) {
    throw new Error('assertion failed: r.width expected 100, got ' + r.width)
  }
  if (r.height != 50) {
    throw new Error('assertion failed: r.height expected 50')
  }
  if (r.label != 'box') {
    throw new Error('assertion failed: r.label expected 'box'')
  }

  console.log('Composite object context verified')
}
