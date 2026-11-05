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
 * @id LEX_02_01_038_PASS_UNICODE_METHOD_OVERRIDE
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: overload/override - Unicode方法在继承中的override
 * @note 正向用例：验证Unicode方法在子类override父类方法时正确使用
 */
class 形状 {
  名称: string = "形状"
  描述(): string {
    return "这是一个" + this.名称
  }
}

class 圆形 extends 形状 {
  名称: string = "圆形"
  描述(): string {
    return "这是一个" + this.名称 + "，半径为0"
  }
}

class 矩形 extends 形状 {
  名称: string = "矩形"
  宽度: number = 0
  高度: number = 0
  描述(): string {
    return "这是一个" + this.名称 + "，" + this.宽度.toString() + "x" + this.高度.toString()
  }
}

function main(): void {
  let 圆: 圆形 = new 圆形()
  let 矩: 矩形 = new 矩形()
  let 圆描述: string = 圆.描述()
  let 矩描述: string = 矩.描述()
  let 基引用: 形状 = new 圆形()
  let 多态描述: string = 基引用.描述()
}